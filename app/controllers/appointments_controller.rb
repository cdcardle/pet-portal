class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all.order(:datetime)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      redirect_to appointment
    else
      render :new, alert: "Appointment not created."
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    if current_user != @appointment.pet.owner && !current_user.admin?
       redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  private

    def appointment_params
      params.require(:appointment).permit(:datetime, :pet_id, :doctor_id)
    end
end
