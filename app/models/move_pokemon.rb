class MovePokemon < ActiveRecord::Base
	belongs_to :move
	belongs_to :pokemon
	serialize :options
end
