class PetsController < ApplicationController
  before_action :is_admin?, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      redirect_to root_path
    end
  end

  def show
    @pet = Pet.find(params[:id])
    redirect_back(fallback_location: root_path) if (!current_user.admin? && current_user.id != @pet.user_id)
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :weight, :color, :breed, :gender, :animal_type)
  end
end
