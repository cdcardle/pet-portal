class User < ApplicationRecord
  enum role: [:guest, :owner, :admin]
  
  devise :database_authenticatable, :registerable, :validatable

  validates_presence_of :email, :password, :first_name, :last_name, :first_street_address, :state, :zipcode
  validates_uniqueness_of :email

  after_initialize :set_default_second_street_address, :set_default_role

  def name
    "#{first_name} #{last_name}"
  end

  def address
    if second_street_address
      "#{first_street_address}, #{second_street_address}, #{city}, #{state} #{zipcode}"
    else
      "#{first_street_address}, #{city}, #{state} #{zipcode}"
    end
  end

  private

  def set_default_second_street_address
    second_street_address |= ""
  end

  def set_default_role
    role |= 0
  end
end
