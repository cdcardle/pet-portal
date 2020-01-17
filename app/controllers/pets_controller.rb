class PetsController < ApplicationController
  before_action :is_admin?, only: [:index, :new, :edit, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :edit, :destroy]

  def index
    @pets = Pet.all
  end
end
