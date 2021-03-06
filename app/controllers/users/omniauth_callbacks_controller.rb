class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.present? && @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      #session["devise.google_data"] = request.env["omniauth.auth"]
      #redirect_to new_user_registration_url
      flash[:notice] = "Login failed. Please get out."
      redirect_to root_path
    end
  end

  def after_omniauth_failure_path_for(scope)
    flash[:notice] = "We are sorry, this is a private party."
    root_path
  end
end
