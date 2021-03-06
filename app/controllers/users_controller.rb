class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:index, :destroy]

  def index
    @admins = User.all.find_all{|e| e.admin?}
    @users = User.all - @admins
  end

  def new
    if current_user && current_user.owner?
      redirect_back(fallback_location: root_path)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    @user.role = user_role
    if @user.save
      if current_user && current_user.admin?
        redirect_to user_path(@user), notice: "You have registered successfully!"
      else
        sign_in @user
        redirect_to user_path(@user), notice: "You have registered successfully!"
      end
    else
      redirect_to new_user_path, alert: "Required fields must not be empty!"
    end
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user && !current_user.admin?
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user && !current_user.admin?
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user.admin? || current_user == @user
      @user.role = user_role
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    User.find(params[:id]).delete
    redirect_to users_path, notice: "Account deleted."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :first_street_address, :second_street_address, :city, :state, :zipcode)
  end

  def user_role
    case params.require(:user).permit(:role)[:role].to_i
    when 1
      "admin"
    when 0
      "owner"
    end
  end
end
