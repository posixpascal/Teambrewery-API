# == Schema Information
#
# Table name: abilities
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  desc       :string(255)
#  desc_short :string(255)
#  name       :string(255)
#  rating     :float
#  num        :integer
#  created_at :datetime
#  updated_at :datetime
#

class Ability < ActiveRecord::Base
    attr_protected :key, :desc, :desc_short, :name, :rating, :num, :created_at, :updated_at
    has_many :pokemon, :through => :pokemon_abilities
    has_many :pokemon_abilities
end
