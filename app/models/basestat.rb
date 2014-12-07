# == Schema Information
#
# Table name: basestats
#
#  id         :integer          not null, primary key
#  pokemon_id :integer
#  hp         :integer
#  atk        :integer
#  def        :integer
#  spa        :integer
#  spd        :integer
#  spe        :integer
#  created_at :datetime
#  updated_at :datetime
#

class Basestat < ActiveRecord::Base
    attr_protected :pokemon_id, :hp, :atk, :def, :spa, :spd, :spe, :created_at, :updated_at
    belongs_to :pokemon
end
