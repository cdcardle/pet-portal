class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all.order(:datetime)
  end

  def new
    @doctor = Doctor.new
  end

  def create
    doctor = Doctor.new(doctor_params)
    if doctor.save
      redirect_to doctor
    else
      render :new, alert: "Doctor not created."
    end
  end

  def show
    @doctor = find_doctor
  end

  def edit
    @doctor = find_doctor
  end

  def update
    @doctor = find_doctor
    @doctor.update(doctor_params)
    redirect_to doctor_path(@doctor)
  end

  def destroy
    find_doctor.delete
    redirect_to doctors_path, notice: "doctor deleted."
  end

  private

    def doctor_params
      params.require(:doctor).permit(:first_name, :last_name)
    end

    def find_doctor
      Doctor.find(params[:id])
    end
end
