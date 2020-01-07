require 'rails_helper'

RSpec.describe Doctor, type: :model do
  include_examples "create models"

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
    it "has many appointments" do
      expect(doctor.appointments).to include(appointment)
    end

    it "has many pets, through appointments" do
      expect(doctor.pets).to include(pet)
    end
  end
end
