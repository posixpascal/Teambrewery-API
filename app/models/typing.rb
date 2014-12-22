# == Schema Information
#
# Table name: typings
#
#  id         :integer          not null, primary key
#  pokemon_id :integer
#  created_at :datetime
#  updated_at :datetime
#
TYPECHART = {
	:"0" => ["Neutral", "1"],
	:"1" => ["Effective", "2x"],
	:"2" => ["Resist", "1/2"],
	:"3" => ["Immunity", "-"],
	:"4" => ["Super Effective", "4x"],
	:"5" => ["Quad Resist", "1/4"]
}
class Typing < ActiveRecord::Base
    belongs_to :pokemon
    has_many :types, :through => :typing_types
    has_many :typing_types
    attr_protected :pokemon, :created_at, :updated_at

    def weaknesses_and_resistances
    	types = self.types
    	multipliers = types.map { |type| {type.name => type.get_all_multipliers} }.flatten

    	if (types.size > 1)
    		# merge 2 type arrays to a single one
    		res = {}
    		multipliers.each do |type_multipliers|
    			type_multipliers.each do |type, type_details|

	    			type_details.each do |td|
	    				# type: Bug, multiplier: 2
	    				multiplier = td[:multiplier]
	    				if not res[td[:type]].nil? # already got a multiplier
	    					if res[td[:type]] == 0
	    						res[td[:type]] = multiplier # use given multiplier
	    					elsif res[td[:type]] == 3 or multiplier == 3 #immunity
	    						res[td[:type]] = 3 # keep 3.
	    					elsif res[td[:type]] == 1 # is weakness
	    						if multiplier == 1
	    							res[td[:type]] = 4 # super effective
	    						elsif multiplier == 2
	    							res[td[:type]] = 0 # normal hit
	    						end
	    					elsif res[td[:type]] == 2 # resist
	    						if multiplier == 1
	    							res[td[:type]] = 0 # normal hit
	    						elsif multiplier == 2 # quadresist
	    							res[td[:type]] = 5
	    						end
	    					end
	    				else
	    					res[td[:type]] = multiplier	
	    				end
	    			end
	    		
	    		end
	    	end

    	else
    		res = {}
    		multipliers.each do |type_multipliers|
    			type_multipliers.each do |type, type_details|
	    			type_details.each do |td|
	    				res[td[:type]] = td[:multiplier]
	    			end
	    		end
    		end
    	end
    	# transform into different list
    	result = {}
    	res.each  {|key, multiplier|
    		result[key] = {
    			:multiplier => multiplier,
    			:typechart => TYPECHART[multiplier.to_s.to_sym]
    		}
    	}
    	return result
    	
    	
    end
end
