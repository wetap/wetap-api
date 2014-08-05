class AuthTokenPairsController < ApplicationController

  def me
    if !user_signed_in?
      return redirect_to user_session_path
    end
  end

end
