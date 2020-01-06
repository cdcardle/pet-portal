class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :first_street_address, :second_street_address, :city, :state, :zipcode, :role)
  end
end
