# == Schema Information
#
# Table name: pets
#
#  id       :bigint           not null, primary key
#  given_id :integer
#  name     :string(255)
#  weight   :string(255)
#  age      :string(255)
#

class Pet < ApplicationRecord
  paginates_per 10
end
