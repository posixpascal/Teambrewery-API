class MoveSerializer < ActiveModel::Serializer
  attributes :id, :name, :type
  def type
     object.type.name 
  end
  
end
