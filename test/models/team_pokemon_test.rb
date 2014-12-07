# == Schema Information
#
# Table name: team_pokemons
#
#  id           :integer          not null, primary key
#  pokemon_id   :integer
#  evspread     :integer
#  nickname     :string(255)
#  happiness    :integer
#  gender       :integer
#  shiny        :boolean
#  ability_id   :integer
#  item_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  learnset_id  :integer
#  moveset_id   :integer
#  ev_spread_id :integer
#

require 'test_helper'

class TeamPokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
