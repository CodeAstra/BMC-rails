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
end