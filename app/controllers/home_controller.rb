class HomeController < ApplicationController
  def land
    if user_signed_in?
      render "dashboard"
    end
  end
end
