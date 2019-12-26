class Doctor < ApplicationRecord

  validates_presence_of :first_name, :last_name
  
  def name
    "Dr. #{first_name} #{last_name}"
  end
end
