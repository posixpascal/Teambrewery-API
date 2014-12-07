# == Schema Information
#
# Table name: ev_spreads
#
#  id              :integer          not null, primary key
#  team_pokemon_id :integer
#  hp              :integer
#  atk             :integer
#  def             :integer
#  spa             :integer
#  spd             :integer
#  spe             :integer
#  hp_ivs          :integer
#  atk_ivs         :integer
#  def_ivs         :integer
#  spa_ivs         :integer
#  spd_ivs         :integer
#  spe_ivs         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class EvSpread < ActiveRecord::Base
    attr_protected :team_pokemon, :hp, :atk, :def, :spa, :spd, :spe, :hp_ivs, :atk_ivs, :def_ivs, :spa_ivs, :spd_ivs, :spe_ivs, :created_at, :updated_at
    belongs_to :moveset
end
