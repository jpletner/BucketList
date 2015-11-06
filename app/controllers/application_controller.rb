class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #  protect_from_forgery with: :exception
#  before_filter :configure_devise_params, if: :devise_controller?

        
  def configure_devise_params
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :city, :state, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:first_name, :last_name, :city, :state, :about, :email, :password, :password_confirmation) }
  end
    
end
