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
    @invoice = invoice_params
    if current_user != @invoice.pet.owner && !current_user.admin?
       redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @invoice = invoice_params
  end

  def update
    @invoice = invoice_params
    @invoice.update(invoice_params)
    redirect_to invoice_path(@invoice)
  end

  def destroy
    invoice_params.delete
    redirect_to invoices_path, notice: "invoice deleted."
  end

  private

    def invoice_params
      params.require(:invoice).permit(:datetime, :pet_id, :doctor_id)
    end

    def invoice_params
      Invoice.find(params[:id])
    end
end
