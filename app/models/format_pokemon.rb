class FormatPokemon < ActiveRecord::Base
  belongs_to :format
  belongs_to :pokemon
end
