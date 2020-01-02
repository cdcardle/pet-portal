require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:appointment) { build(:appointment) }
  let(:casey) { build(:casey) }
  let(:tom) { build(:tom) }
  let(:invoice) { build(:invoice) }
  let(:doctor) { build(:doctor) }

  describe "Model" do
    it "has a first and last name" do
      expect(doctor.first_name).to eq("Carol")
      expect(doctor.last_name).to eq("Antique")
    end

    it "responds to name" do
      expect(doctor.name).to eq("Dr. Carol Antique")
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

    it "has many appointments" do
      expect(doctor.appointments).to include(appointment)
    end

    it "has many pets, through appointments" do
      expect(doctor.pets).to include(casey)
    end
  end
end
