require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:appointment) { build(:appointment) }
  let(:casey) { build(:casey) }
  let(:tom) { build(:tom) }
  let(:invoice) { build(:invoice) }
  let(:doctor) { build(:doctor) }

  describe "Model" do
    it "has a total" do
      expect(invoice.total).to eq(137.19)
    end

    it "has a date" do
      invoice.appointment = appointment
      expect(invoice.date).to eq("2019-01-06")
    end
  end

  describe "Associations" do
    before do
      casey.owner = tom
      casey.save

      appointment.pet = casey
      appointment.doctor = doctor
      appointment.save

      invoice.appointment = appointment
      invoice.pet = casey
      invoice.save
    end

    it "has an appointment" do
      expect(invoice.appointment).to eq(appointment)
    end

    it "has a payer" do
      expect(invoice.payer).to eq(tom)
    end
  end
end
