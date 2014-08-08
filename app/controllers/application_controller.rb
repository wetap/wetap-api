class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :json

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || auth_token_pairs_me_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      head :forbidden
    else
      redirect_to sign_in_url
    end
  end

end
