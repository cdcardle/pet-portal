class Pet < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id", optional: true
  has_many :appointments
  has_many :invoices, through: :appointments
  has_many :doctors, through: :appointments

  validates_presence_of :name, :animal_type, :breed, :weight, :age, :color, :gender
  validates :gender, inclusion: { in: %w(Male Female), message: "must be Male or Female" }
  validates :animal_type, inclusion: { in: %w(Dog Cat), message: "must be Dog or Cat" }

  def age_in_years
    age == 12 ? "#{age / 12.0} year" : "#{age / 12.0} years"
  end
end
