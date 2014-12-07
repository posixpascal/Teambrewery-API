class MovesetItem < ActiveRecord::Base
    belongs_to :item
    belongs_to :moveset
end
