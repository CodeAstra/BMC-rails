class ChartVersionsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @chart = current_user.charts.find(params[:chart_id])
    @chart_version = @chart.versions.find(params[:id])
    @chart_version.destroy

    redirect_to chart_path(@chart), notice: "#{@chart_version.title_for_display} has been successfully deleted."
  end
end
