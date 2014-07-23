class AuthTokenPairsController < ApplicationController

  def me
    if !user_signed_in?
      session['user_return_to']
      return redirect_to user_session_path
    end
  end

end
