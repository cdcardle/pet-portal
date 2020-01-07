require 'rails_helper'

RSpec.describe Pet, type: :model do
  include_examples "create models"

  describe "Model" do

    it 'has a name' do
      expect(pet.name).to eq("Casey")
    end

    it 'has an animal_type' do
      expect(pet.animal_type).to eq("dog")
    end

    it 'has a breed' do
      expect(pet.breed).to eq("German Shepherd Dog")
    end

    it 'has a gender' do
      expect(pet.gender).to eq("female")
    end

    it 'has a color' do
      expect(pet.color).to eq("Black and Tan")
    end

    it 'has a weight' do
      expect(pet.weight).to eq(50)
    end

    it 'has an age' do
      expect(pet.age).to eq(7)
    end
  end

  describe "Associations" do
    it "has an owner" do
      expect(pet.owner).to eq(user)
    end
    
    it "has many appointments" do
      expect(pet.appointments).to include(appointment)
    end

    it "has many invoices" do
      expect(pet.invoices).to include(invoice)
    end

    it "has many doctors, through appointments" do
      expect(pet.doctors).to include(doctor)
    end
  end
end
