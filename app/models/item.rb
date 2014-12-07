# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  name       :string(255)
#  num        :integer
#  gen        :integer
#  desc       :string(255)
#  details_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base
    attr_protected :key, :name, :num, :gen, :desc, :details, :created_at, :updated_at
    has_one :details, :class_name => "ItemDetail"
end
