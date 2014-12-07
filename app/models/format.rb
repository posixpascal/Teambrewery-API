class Format < ActiveRecord::Base
  has_many :pokemons, :through => :format_pokemons
  has_many :format_pokemons
  
  scope :most_valuables, -> { where('name = ? or name = ?', "OU", "BL") }
end
