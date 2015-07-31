class ChartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @charts = current_user.charts.all
    @new_chart = current_user.charts.new
  end

  def create
    @chart = current_user.charts.new(chart_params)
    if @chart.save
      redirect_to chart_path(@chart)
    else
      redirect_to root_path, alert: "Something went wrong. Please try again"
    end
  end

  def show
    @chart = current_user.charts.find(params[:id])
  end

private
  def chart_params
    params.require(:chart).permit(:title, :description)
  end
end
