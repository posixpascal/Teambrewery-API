class TeamFormat < ActiveRecord::Base
	attr_accessible :format_id, :team_id
	belongs_to :team 
	belongs_to :format
end
