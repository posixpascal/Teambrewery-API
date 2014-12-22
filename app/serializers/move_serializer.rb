class MoveSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :category
  def type
     object.type.name 
  end
  
end
