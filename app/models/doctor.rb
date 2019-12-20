class Doctor < ApplicationRecord
  def name
    "Dr. #{first_name} #{last_name}"
  end
end
