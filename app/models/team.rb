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
    attr_protected :name, :user_id, :synergy_level
    belongs_to :user
    has_many :team_pokemon
    has_many :pokemon, :through => :team_pokemon
    has_many :typings, :through => :team_pokemon
end
