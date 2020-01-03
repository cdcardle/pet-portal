require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:user) { build(:user) }
  let(:pet) { build(:pet) }
  let(:appointment) { build(:appointment) }
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
      pet.owner = user
      pet.save

      appointment.pet = pet
      appointment.doctor = doctor
      appointment.save

      invoice.appointment = appointment
      invoice.save
    end

    it "has many appointments" do
      expect(doctor.appointments).to include(appointment)
    end

    it "has many pets, through appointments" do
      expect(doctor.pets).to include(pet)
    end
  end
end
