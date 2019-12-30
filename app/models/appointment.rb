class Appointment < ApplicationRecord
  has_one :invoice
  belongs_to :pet
  belongs_to :doctor

  validates_presence_of :datetime

  def time
    datetime.strftime("%l:%M%P").strip
  end

  def date
    datetime.strftime("%Y-%m-%d")
  end
end
