class HomeController < ApplicationController
  def land
    if user_signed_in?
      redirect_to charts_path
    else
      @landing_page = true
    end
  end
end
