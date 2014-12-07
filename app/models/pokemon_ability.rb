class PokemonAbility < ActiveRecord::Base
    belongs_to :ability
    belongs_to :pokemon
end
