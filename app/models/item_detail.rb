# == Schema Information
#
# Table name: item_details
#
#  id               :integer          not null, primary key
#  item_id          :integer
#  megastone        :boolean
#  mega_evolves     :integer
#  berry            :boolean
#  naturalgift      :string(255)
#  naturalgift_bp   :integer
#  naturalgift_type :integer
#  fling            :boolean
#  fling_bp         :integer
#  unreleased       :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

class ItemDetail < ActiveRecord::Base
    attr_protected :item, :megastone, :mega_evolves, :berry, :naturalgift, :naturalgift_bp, :naturalgift_type, :fling, :fling_bp, :unreleased, :created_at, :updated_at
    belongs_to :item
    belongs_to :pokemon, :class_name => "Pokemon", :foreign_key => "mega_evolves"
end
