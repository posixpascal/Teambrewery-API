#!/usr/bin/env ruby
# Typechart. 

require 'json'
require File.expand_path('../../config/environment', __FILE__)

types = JSON.parse(open("bin/types.json").read)
types.each do |key, type_data|
	root_type = Type.find_by_name(key)
	if not root_type.nil?
		root_type.type_details.delete_all
		type_data["damageTaken"].each do |target_type, multiplier|
			if not Type.find_by_name(target_type).nil?
				t = root_type.type_details.new
				t.target_type_id = Type.find_by_name(target_type).id
				t.multiplier = multiplier
				t.root_type = root_type
				t.save()
			end
		end
		puts "Saved #{root_type.type_details.count} type details for #{root_type.name}"
	end
end
puts "Done."