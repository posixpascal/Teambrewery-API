# == Schema Information
#
# Table name: abilities
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  desc       :string(255)
#  desc_short :string(255)
#  name       :string(255)
#  rating     :float
#  num        :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
