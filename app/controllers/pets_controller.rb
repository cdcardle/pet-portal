class PetsController < ApplicationController
  before_action :is_admin?, only: [:index, :new, :edit, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :edit, :destroy]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def show
    @pet = Pet.find(params[:id])
    redirect_back(fallback_location: root_path) if (!current_user.admin? && current_user.id != @pet.user_id)
  end
end
