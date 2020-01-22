class PetSerializer < ActiveModel::Serializer
  attributes  :id,
              :name,
              :weight,
              :age
end
