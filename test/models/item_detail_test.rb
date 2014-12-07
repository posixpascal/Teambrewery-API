# == Schema Information
#
# Table name: item_details
#
#  id               :integer          not null, primary key
#  item_id          :integer
#  megastone        :boolean
#  mega_evolves     :integer
#  berry            :boolean
#  naturalgift      :string(255)
#  naturalgift_bp   :integer
#  naturalgift_type :integer
#  fling            :boolean
#  fling_bp         :integer
#  unreleased       :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class ItemDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
