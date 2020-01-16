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
    ['Alabama', 'AL'],
    ['Alaska', 'AK'],
    ['Arizona', 'AZ'],
    ['Arkansas', 'AR'],
    ['California', 'CA'],
    ['Colorado', 'CO'],
    ['Connecticut', 'CT'],
    ['Delaware', 'DE'],
    ['District of Columbia', 'DC'],
    ['Florida', 'FL'],
    ['Georgia', 'GA'],
    ['Hawaii', 'HI'],
    ['Idaho', 'ID'],
    ['Illinois', 'IL'],
    ['Indiana', 'IN'],
    ['Iowa', 'IA'],
    ['Kansas', 'KS'],
    ['Kentucky', 'KY'],
    ['Louisiana', 'LA'],
    ['Maine', 'ME'],
    ['Maryland', 'MD'],
    ['Massachusetts', 'MA'],
    ['Michigan', 'MI'],
    ['Minnesota', 'MN'],
    ['Mississippi', 'MS'],
    ['Missouri', 'MO'],
    ['Montana', 'MT'],
    ['Nebraska', 'NE'],
    ['Nevada', 'NV'],
    ['New Hampshire', 'NH'],
    ['New Jersey', 'NJ'],
    ['New Mexico', 'NM'],
    ['New York', 'NY'],
    ['North Carolina', 'NC'],
    ['North Dakota', 'ND'],
    ['Ohio', 'OH'],
    ['Oklahoma', 'OK'],
    ['Oregon', 'OR'],
    ['Pennsylvania', 'PA'],
    ['Puerto Rico', 'PR'],
    ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'],
    ['South Dakota', 'SD'],
    ['Tennessee', 'TN'],
    ['Texas', 'TX'],
    ['Utah', 'UT'],
    ['Vermont', 'VT'],
    ['Virginia', 'VA'],
    ['Washington', 'WA'],
    ['West Virginia', 'WV'],
    ['Wisconsin', 'WI'],
    ['Wyoming', 'WY']
  ]

  private

  def set_default_second_street_address
    second_street_address |= ""
  end

  def set_default_role
    role |= "owner"
  end
end
