class RegistrationsController < Devise::RegistrationsController

  private

  #binding.pry
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :phone, :password_confirmation, :current_password)
  end
end
