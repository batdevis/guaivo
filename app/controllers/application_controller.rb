class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, prepend: true

  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
      when :user, User
        root_path
      when :admin, Admin
        rails_admin_path
      else
        super
    end
  end
end
