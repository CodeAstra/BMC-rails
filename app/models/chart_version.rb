# == Schema Information
#
# Table name: chart_versions
#
#  id                     :integer          not null, primary key
#  chart_id               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  counter                :integer
#  title                  :string
#  description            :text
#  customer_segments      :text
#  value_propositions     :text
#  customer_relationships :text
#  channels               :text
#  key_activities         :text
#  key_resources          :text
#  key_partnerships       :text
#  cost_structure         :text
#  revenue_streams        :text
#

class ChartVersion < ActiveRecord::Base
  belongs_to :chart

  validates :counter, presence: true, numericality: true,
                      uniqueness: {scope: :chart_id}

  before_validation :set_details
  after_destroy :correct_counters_of_siblings

  def title_for_display
    "V#{self.counter} - #{self.created_at.strftime('%b %e, %Y')}"
  end

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

  def correct_counters_of_siblings
    self.chart.versions.where('counter > ?', self.counter).each do |cv|
      cv.update_attribute(:counter, cv.counter - 1)
    end
  end
end
