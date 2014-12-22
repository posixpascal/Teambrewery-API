# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  user_id       :integer
#  synergy_level :float
#  created_at    :datetime
#  updated_at    :datetime
#

class Team < ActiveRecord::Base
	#include FriendlyId
	paginates_per 10
	#friendly_id :name, :use => :slug

    belongs_to :user
    has_many :pokemons, :through => :team_pokemons
    has_many :typings, :through => :team_pokemons
    has_many :team_pokemons
    has_one :format, :through => :team_format
    has_one :team_format

    serialize :options

end
