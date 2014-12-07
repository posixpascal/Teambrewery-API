class MoveslotMove < ActiveRecord::Base
    belongs_to :move
    belongs_to :moveslot
end
