class User < ApplicationRecord
  enum role: [:owner, :admin]

  has_many :pets
  has_many :appointments, through: :pets
  has_many :invoices, through: :pets
  
  devise :database_authenticatable, :validatable

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :first_street_address, unless: lambda {role == "admin"}
  validates_presence_of :city, unless: lambda {role == "admin"}
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

  STATES = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'District of Columbia',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Puerto Rico',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming'
  ]

  private

  def set_default_second_street_address
    second_street_address |= ""
  end

  def set_default_role
    role |= "owner"
  end
end
