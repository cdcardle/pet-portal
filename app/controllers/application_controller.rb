class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def is_admin?
    redirect_back(fallback_location: root_path) unless current_user && current_user.admin?
  end
end
