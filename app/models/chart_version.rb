# == Schema Information
#
# Table name: chart_versions
#
#  id         :integer          not null, primary key
#  chart_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  counter    :integer
#

class ChartVersion < ActiveRecord::Base
  belongs_to :chart

  validates :counter, presence: true, numericality: true,
                      uniqueness: {scope: :chart_id}

  before_validation :set_details

private
  def set_details
    self.title = self.chart.title
    self.description = self.chart.description
    self.customer_segments = self.chart.customer_segments
    self.value_propositions = self.chart.value_propositions
    self.customer_relationships = self.chart.customer_relationships
    self.channels = self.chart.channels
    self.key_activities = self.chart.key_activities
    self.key_resources = self.chart.key_resources
    self.key_partnerships = self.chart.key_partnerships
    self.cost_structure = self.chart.cost_structure
    self.revenue_streams = self.chart.revenue_streams
    self.counter = self.chart.versions.count + 1 if self.new_record?
  end
end
