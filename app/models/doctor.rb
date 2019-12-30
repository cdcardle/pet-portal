class Doctor < ApplicationRecord
  has_many :appointments
  has_many :pets, through: :appointments

  validates_presence_of :first_name, :last_name
  
  def name
    "Dr. #{first_name} #{last_name}"
  end
end
