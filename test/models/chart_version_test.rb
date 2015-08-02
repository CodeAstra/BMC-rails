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

require 'test_helper'

class ChartVersionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
