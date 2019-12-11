class User < ApplicationRecord
  enum role: [:guest, :owner, :admin]
  
  devise :database_authenticatable, :registerable, :validatable

  validates_presence_of :email, :password, :first_name, :last_name, :first_street_address, :state, :zipcode

  def name
    "#{first_name} #{last_name}"
  end

  def address
    "#{first_street_address} #{second_street_address}, #{city}, #{state} #{zipcode}"
  end
end
