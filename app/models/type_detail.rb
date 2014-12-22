class TypeDetail < ActiveRecord::Base
	belongs_to :root_type, :class_name => "Type"
	has_one :target_type, :class_name => "Type", :foreign_key => "target_type_id"

	def target_type
		ApplicationController::Type.find(self.target_type_id)
	end
end
