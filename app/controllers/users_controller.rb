class UsersController < ApplicationController
#before_filter :configure_sign_up_params, only: [:create]
#before_filter :configure_account_update_params, only: [:update]
before_action :authenticate_user!

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_in){ |u| u.permit(:email, :password) }
     devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:first_name, :email, :password, :password_confirmation)}
     devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:first_name, :email, :password, :password_confirmation) }
   end

  def index
     @users = User.all
  end

  def show
    @user = current_user
    render 'show.html.erb'
  end

  def view_profile
    @user = User.find(params[:id])
    render 'show.html.erb'
  end

  def add_adventure
    @user = User.find(params[:id])
    newAdventure = Adventure.new(params[:adventure])
    if newAdventure.valid?
      newAdventure.title.downcase! # ! alters the original
      newAdventure.save
      newAdventure.creator = @user.first_name + ' ' + @user.last_name
      if !params[:image_url].blank?
        newAdventure.image = newAdventure.image_from_url(params[:image_url])
      end
        if params[:image_url].blank? && newAdventure.image.blank?
          newAdventure.image = "https://briancromer.files.wordpress.com/2010/09/ds-print1.jpg"
      end
      @user.adventures << newAdventure
      @user.save
    end
    render 'show.html.erb'
  end

  def search_users
    if !params[:creator].nil?
      search_string = params[:creator]
      @user = User.basic_search({first_name: search_string, last_name: search_string}, false)
    end
  end

  def newPic
    @user = current_user
  end

  def cancel
  end

  def addUserPicture
    @user = current_user
    if params[:image_cb2] == "3"
      @user.image = @user.image_from_url(params[:image_url2])
    else
      @user.image = params[:user_image]
    end
    @user.save
    redirect_to users_show_path
  end

  def followUser
    @user = User.find(params[:id])
    current_user.follow!(@user)
    redirect_to "/users/#{@user.id}"
  end

    def unfollowUser
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    redirect_to "/users/#{@user.id}"
  end

    def followPage
      @followers = current_user.followees(User)
      @yourFollowers = current_user.followers(User)
    end

private
  def set_user
    @user = User.find(params[:id])
  end


 def user_params
     params.require(:user).permit(:first_name, :last_name, :city, :state, :about, :image, adventures_attributes: [:id, :title, :description, :duedate, :creator, :priority, :completed, :image, :_destroy])
 end
end
