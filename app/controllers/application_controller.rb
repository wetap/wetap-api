class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :json
  # We'll just use this as a launch point for our App
  def index
    # Render just the layout since this application is Angular driven
    # our layout/application has all the angular logic and our controllers
    # have no views for themselves. We just need a place to launch from
    # and this happens to be it. So we have no view (thus :nothing => true)
    # but we still want the layout (since it has the App bootstrap code)
    render :layout => 'application', :nothing => true
  end

  def javascript_map
    # Chrome keeps asking for these non-existent maps for javascript libraries.
    # It slows things down horribly.
    render '/public/404.html', :status => 404
  end
end
