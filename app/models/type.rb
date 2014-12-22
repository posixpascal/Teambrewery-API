# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Type < ActiveRecord::Base
    attr_protected :name, :color, :created_at, :updated_at
    has_many :type_details

    def get_resistances
    	self.type_details.where(:multiplier => 2).map {|i| i.name }
    end

    def get_weaknesses
    	self.type_details.where(:multiplier => 1).map {|i| i.name }
    end

    def get_immunities
    	self.type_details.where(:multiplier => 3).map {|i| i.name }
    end

    def get_neutrals
    	self.type_details.where(:multiplier => 0).map {|i| i.name }
    end

    def get_all_multipliers
    	self.type_details.map {|i|
    		k = {}
    		k[:type] = i.target_type.name
    		k[:multiplier] = i.multiplier
    		k
    	}
    end
end
