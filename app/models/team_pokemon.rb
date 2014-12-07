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

class TeamPokemon < ActiveRecord::Base
    attr_protected :pokemon, :evspread, :happiness, :nickname, :gender
    attr_protected :shiny, :ability, :item, :created_at, :updated_at, :learnset_id
    attr_protected :moveset_id, :ev_spread_id
    has_one :pokemon
    has_one :ev_spread
    has_one :item
    has_one :ability
    belongs_to :team
    belongs_to :user
    has_one :moveset
    has_one :typing, :foreign_key => "typing"
    
    
end
