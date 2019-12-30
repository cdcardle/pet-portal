class Invoice < ApplicationRecord
  belongs_to :appointment
  belongs_to :pet

  validates_presence_of :total

  def date
    appointment.date
  end
end
