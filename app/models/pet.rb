class Pet < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :appointments
  has_many :invoices
  has_many :doctors, through: :appointments

  validates_presence_of :name, :animal_type, :breed, :weight, :age, :color, :gender
end
