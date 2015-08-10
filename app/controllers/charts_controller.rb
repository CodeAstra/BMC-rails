class ChartsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_chart, only: [:show, :update, :destroy, :versionalize, :share]

  def index
    @charts = current_user.charts.all
    @new_chart = current_user.charts.new
  end

  def create
    @chart = current_user.authored_charts.new(chart_params)
    if @chart.save
      redirect_to chart_path(@chart)
    else
      redirect_to root_path, alert: "#{@chart.errors.full_messages.join(", ")}. Please try again"
    end
  end

  def show
    if params[:v]
      @chart_version = @chart.versions.where(counter: params[:v].to_i).first
    end
  end

  def update
    @chart.update_attributes(chart_update_params)

    respond_to do |format|
      format.js { render 'update' }
      format.json { respond_with_bip(@chart) }
    end
  end

  def share
    emails = params[:chart][:invite_emails]
    emails.gsub!(" ", "")
    emails = emails.split(",")
    ignored_emails = []
    emails.reject!(&:blank?)
    emails.uniq!
    emails.each do |email|
      usr = User.find_by(email: email)
      if usr
        @chart.share_with(usr)
      else
        ignored_emails.push(email)
      end
    end

    if ignored_emails.any?
      redirect_to chart_path(@chart), alert: "The following emails are not associated with any user; Hence, not share with them: #{ignored_emails.join(', ')}."
    else
      redirect_to chart_path(@chart), notice: "Successfully shared with #{emails.count} users."
    end
  end

  def destroy
    @chart.destroy
    redirect_to root_path, notice: "#{@chart.title} deleted successfully."
  end

  def versionalize
    @chart.versionalize!

    redirect_to chart_path(@chart, v: @chart.versions.last.counter)
  end

private
  def chart_params
    params.require(:chart).permit(:title, :description)
  end

  def chart_update_params
    params.require(:chart).permit(
      :title,
      :description,
      :customer_segments, 
      :value_propositions, 
      :customer_relationships, 
      :channels, 
      :key_activities, 
      :key_resources, 
      :key_partnerships, 
      :cost_structure, 
      :revenue_streams
    )
  end

  def fetch_chart
    @chart = current_user.charts.find(params[:id])
  end
end
