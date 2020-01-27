class Invoice < ApplicationRecord
  belongs_to :appointment

  validates_presence_of :cents

  def pet
    appointment.pet
  end
  
  def total
    "$#{cents / 100.00}"
  end

  def date
    appointment.date
  end

  def payer
    pet.owner
  end
end
