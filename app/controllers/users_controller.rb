class UsersController < ApplicationController
#before_filter :authenticate_user!
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  before_action :authenticate_user!
    
  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_in){ |u| u.permit(:email, :password) }
     devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:first_name, :email, :password, :password_confirmation)}
     devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:first_name, :email, :password, :password_confirmation) }
   end

  def show
    @user = current_user
    render 'show.html.erb'
  end

  def add_adventure
    @user = User.find(params[:id])
    newAdventure = Adventure.new(params[:adventure])
    if newAdventure.valid?
      newAdventure.title.downcase! # ! alters the original
      newAdventure.save
      @user.adventures << newAdventure
      @user.save
    end
    render 'show.html.erb'
  end
    
private
  
  def set_user
    @user = User.find(params[:id])
  end


 def user_params
     params.require(:user).permit(:first_name, :last_name, :city, :state, :about, adventures_attributes: [:id, :title, :description, :duedate, :creator, :priority, :completed, :image, :_destroy])
 end    
    
    
end