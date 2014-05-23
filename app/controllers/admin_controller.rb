class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    # Render just the layout since this application is Angular driven
    # our layout/application has all the angular logic and our controllers
    # have no views for themselves. We just need a place to launch from
    # and this happens to be it. So we have no view (thus :nothing => true)
    # but we still want the layout (since it has the App bootstrap code)
  end

end