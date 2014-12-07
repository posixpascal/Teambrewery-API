# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  pokedex    :integer
#  species    :string(255)
#  basestats  :integer
#  height     :integer
#  weight     :integer
#  color      :string(255)
#  mega       :boolean
#  mega_forme :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
