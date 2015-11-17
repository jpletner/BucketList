class RegistrationsController < Devise::RegistrationsController

  def after_update_path_for(resource)
      users_show_path
  end

  def after_sign_in_path_for(resource)
      users_show_path
  end

  def after_sign_up_path_for(resource)
      users_show_path
  end

  def sign_in_from_home

  end

private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :city, :state, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :city, :state, :about, :email, :password, :password_confirmation, :current_password)
  end

end
