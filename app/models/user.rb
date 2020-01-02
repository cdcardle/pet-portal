class User < ApplicationRecord
  enum role: [:owner, :admin]

  has_many :pets
  has_many :appointments, through: :pets
  has_many :invoices, through: :pets
  
  devise :database_authenticatable, :registerable, :validatable

  validates_presence_of :first_name, unless: lambda {role == "admin"}
  validates_presence_of :last_name, unless: lambda {role == "admin"}
  validates_presence_of :first_street_address, unless: lambda {role == "admin"}
  validates_presence_of :state, unless: lambda {role == "admin"}
  validates_presence_of :zipcode, unless: lambda {role == "admin"}
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

  def is_admin?
    role == "admin"
  end

  private

  def set_default_second_street_address
    second_street_address |= ""
  end

  def set_default_role
    role |= 0
  end
end
