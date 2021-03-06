class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: [:index, :new, :create, :edit, :update, :destroy]

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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    Pet.find(params[:id]).delete
    redirect_to pets_path, notice: "Pet deleted."
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :weight, :color, :breed, :gender, :animal_type)
  end
end
