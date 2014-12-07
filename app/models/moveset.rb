# == Schema Information
#
# Table name: movesets
#
#  id              :integer          not null, primary key
#  team_pokemon_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Moveset < ActiveRecord::Base
    attr_protected :team_pokemon, :created_at, :updated_at
    belongs_to :pokemon
    has_many :moveslots
    has_many :items
    has_one :nature
    has_many :ev_spreads
    has_one :author, :class_name => "User"
    
    has_many :items, :through => :moveset_items
    has_many :moveset_items
    
    has_many :abilities, :through => :moveset_abilities
    has_many :moveset_abilities
    
    has_many :moves, :through => :moveslots
    

end
