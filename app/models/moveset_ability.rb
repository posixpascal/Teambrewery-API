class MovesetAbility < ActiveRecord::Base
    belongs_to :ability
    belongs_to :moveset
end
