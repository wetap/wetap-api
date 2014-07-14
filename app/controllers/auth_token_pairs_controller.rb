class AuthTokenPairsController < ApplicationController

  before_filter :authenticate_user!

  def me
  end

end
