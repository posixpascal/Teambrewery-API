# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  pokedex    :integer
#  species    :string(255)
#  basestat  :integer
#  height     :integer
#  weight     :integer
#  color      :string(255)
#  mega       :boolean
#  mega_forme :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Pokemon < ActiveRecord::Base
    paginates_per 50
    attr_protected :key, :pokedex, :species, :basestat, :height, :weight, :color, :mega, :mega_forme
    attr_protected :created_at, :updated_at
    has_one :typing

    has_many :abilities, :through => :pokemon_abilities
    has_many :pokemon_abilities
    has_one :basestat
    has_many :evolutions
    belongs_to :family
    has_many :movesets
    has_many :random_moves, :through => :random_battle_moves, :source => "move"
    has_many :random_battle_moves
    
    has_one :format, :through => :format_pokemon
    has_one :format_pokemon

    has_many :moves, :through => :move_pokemons
    has_many :move_pokemons

    mount_uploader :sprite, SpriteUploader


    scope :spinner, -> { Move.get("Rapid Spin").pokemons }
    scope :defogger, -> { Move.get("Defog").pokemons }
    scope :baton_passer, -> { Move.get("Baton Pass").pokemons }
    scope :momentum, -> { Move.get(["Volt Switch", "U-turn", "Parting Shot"]).map(&:pokemons).flatten! }
    scope :most_valuables, -> { Format.most_valuables.map {|format| format.pokemons }.flatten }

    def sprite_url
     if Rails.env.development? 
      return "http://teambrewery.dev:3333#{(self.sprite.url)}" 
     else
      return "http://api.teambrewery.io#{self.sprite.url}"
     end
    end
    def in_tier? tier
        self.format.name == tier
    end

    def weaknesses_and_resistances
        self.typing.weaknesses_and_resistances
    end

    def display_name

        self.species
    end
end
