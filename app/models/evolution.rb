class Evolution < ActiveRecord::Base
    has_one :evolution, :class_name => "Pokemon"
    belongs_to :pokemon
end
