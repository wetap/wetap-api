class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :json

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.admin?
      admin_root_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || water_fountains_after_login_path
    end
  end

end
