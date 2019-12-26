class Invoice < ApplicationRecord
  belongs_to :appointment

  validates_presence_of :total

  def date
    appointment.date
  end
end
