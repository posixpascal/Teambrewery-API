# == Schema Information
#
# Table name: typings
#
#  id         :integer          not null, primary key
#  pokemon_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Typing < ActiveRecord::Base
    belongs_to :pokemon
    has_many :types, :through => :typing_types
    has_many :typing_types
    attr_protected :pokemon, :created_at, :updated_at
end
