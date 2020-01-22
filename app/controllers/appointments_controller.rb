class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all.order(:datetime)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    binding.pry
    appointment = Appointment.new(appointment_params)
    if appointment.save
      redirect_to appointment
    else
      render :new
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  private

    def appointment_params
      params.require(:appointment).permit(:datetime)
    end
end
