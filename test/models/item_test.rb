# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  name       :string(255)
#  num        :integer
#  gen        :integer
#  desc       :string(255)
#  details_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
