class Format < ActiveRecord::Base
  has_many :pokemons, :through => :format_pokemons
  has_many :format_pokemons
  has_many :teams, :through => :team_formats
  has_many :team_formats
  scope :most_valuables, -> { where('name = ? or name = ?', "OU", "BL") }
end
