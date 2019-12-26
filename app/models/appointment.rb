class Appointment < ApplicationRecord
  has_many :invoices

  validates_presence_of :datetime

  def time
    datetime.strftime("%l:%M%P").strip
  end

  def date
    datetime.strftime("%Y-%m-%d")
  end
end
