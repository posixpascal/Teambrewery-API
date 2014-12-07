# == Schema Information
#
# Table name: ev_spreads
#
#  id              :integer          not null, primary key
#  team_pokemon_id :integer
#  hp              :integer
#  atk             :integer
#  def             :integer
#  spa             :integer
#  spd             :integer
#  spe             :integer
#  hp_ivs          :integer
#  atk_ivs         :integer
#  def_ivs         :integer
#  spa_ivs         :integer
#  spd_ivs         :integer
#  spe_ivs         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class EvSpreadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
