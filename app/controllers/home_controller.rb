class HomeController < ApplicationController
  def land
    if user_signed_in?
      render "dashboard"
    else
      @landing_page = true
    end
  end
end
