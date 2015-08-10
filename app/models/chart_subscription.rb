class ChartSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :chart

  validates :user, presence: true
  validates :chart_id, presence: true, numericality: true, uniqueness: {scope: :user_id}
end
