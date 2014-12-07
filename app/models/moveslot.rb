class Moveslot < ActiveRecord::Base
    has_many :moves, :through => :moveslot_moves
    has_many :moveslot_moves
    belongs_to :moveset
end
