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
end
