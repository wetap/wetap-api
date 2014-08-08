class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :json

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.admin?
      admin_path
    else
      stored_location_for(resource) || auth_token_pairs_me_path
    end
  end

end
