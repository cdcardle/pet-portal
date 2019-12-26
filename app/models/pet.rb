class Pet < ApplicationRecord
  validates_presence_of :name, :animal_type, :breed, :weight, :age, :color, :gender
end
