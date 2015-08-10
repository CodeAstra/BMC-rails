# == Schema Information
#
# Table name: charts
#
#  id                     :integer          not null, primary key
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
#  owner_id               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Chart < ActiveRecord::Base
  attr_accessor :invite_emails

  belongs_to :owner, class_name: User.name
  has_many :versions, class_name: ChartVersion.name, dependent: :destroy
  has_many :chart_subscriptions
  has_many :users, through: :chart_subscriptions

  validates :title, presence: true
  validates :owner, presence: true

  after_create :subscribe_owner

  def versionalize!
    self.versions.create!
  end

  def share_with(usr)
    ChartSubscription.find_or_create_by(user_id: usr.id, chart_id: self.id)    
  end

private
  def subscribe_owner
    self.share_with(self.owner)
  end
end
