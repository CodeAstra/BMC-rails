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

require 'test_helper'

class ChartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
