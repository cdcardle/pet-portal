class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @invoices = Invoice.all.order(:datetime)
  end

  def new
    @invoice = Invoice.new
  end

  def create
    invoice = Invoice.new(invoice_params)
    if invoice.save
      redirect_to invoice
    else
      render :new, alert: "invoice not created."
    end
  end

  def show
    @invoice = find_invoice
    if current_user != @invoice.pet.owner && !current_user.admin?
       redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @invoice = find_invoice
  end

  def update
    @invoice = find_invoice
    @invoice.update(invoice_params)
    redirect_to invoice_path(@invoice)
  end

  def destroy
    find_invoice.delete
    redirect_to invoices_path, notice: "invoice deleted."
  end

  private

    def invoice_params
      params.require(:invoice).permit(:cents, :appointment_id)
    end

    def find_invoice
      Invoice.find(params[:id])
    end
end
