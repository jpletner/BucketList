class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :configure_devise_params, if: :devise_controller?
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  
    
  def update
     self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
     if resource.update_with_password(user_params)
       if is_navigational_format?
         flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ? :update_needs_confirmation : :updated
         set_flash_message :notice, flash_key
       end
       sign_in resource_name, resource, :bypass => true
       respond_with resource, :location => after_update_path_for(resource)
     else
       clean_up_passwords resource
       respond_with resource
     end
   end
    
  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_in){ |u| u.permit(:email, :password) }
     devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:first_name, :last_name, :city, :state, :email, :password, :password_confirmation)}
      devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:first_name, :last_name, :city, :state, :about, :email, :password, :password_confirmation) }
   end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
#  def configure_account_update_params
#    devise_parameter_sanitizer.for(:account_update) << :attribute
#  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
private
  
  def set_recipe
      @user = User.find(params[:id])
  end


 def user_params
     params.require(:user).permit(:first_name, :last_name, :city, :state, :about, adventures_attributes: [:id, :title, :description, :duedate, :creator, :priority, :completed, :_destroy])
 end
    
end
