class Invoice < ApplicationRecord
  belongs_to :appointment
  belongs_to :pet

  validates_presence_of :cents

  def total
    cents / 100.00
  end

  def date
    appointment.date
  end

  def payer
    pet.owner
  end
end
