# == Schema Information
#
# Table name: basestats
#
#  id         :integer          not null, primary key
#  pokemon_id :integer
#  hp         :integer
#  atk        :integer
#  def        :integer
#  spa        :integer
#  spd        :integer
#  spe        :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class BasestatsTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
