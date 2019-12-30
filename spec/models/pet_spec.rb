require 'rails_helper'

RSpec.describe Pet, type: :model do
  let(:casey) { build(:casey) }
  let(:spot) { build(:spot) }
  let(:tom) { build(:tom) }
  let(:appointment) { build(:appointment) }
  let(:invoice_one) { build(:invoice_one) }

  describe "Model" do

    it 'has a name' do
      expect(casey.name).to eq("Casey")
    end

    it 'has an animal_type' do
      expect(casey.animal_type).to eq("Dog")
    end

    it 'has a breed' do
      expect(casey.breed).to eq("German Shepherd Dog")
    end

    it 'has a gender' do
      expect(casey.gender).to eq("female")
    end

    it 'has a color' do
      expect(casey.color).to eq("Black and Tan")
    end

    it 'has a weight' do
      expect(casey.weight).to eq(50)
    end

    it 'has an age' do
      expect(casey.age).to eq(7)
    end
  end

  describe "Associations" do
    before do
      spot.owner = tom
      casey.owner = tom
      spot.save
      casey.save

      appointment.pet = casey
      appointment.save

      invoice_one.appointment = appointment
      invoice_one.pet = casey
      invoice_one.save
    end

    it "has an owner" do
      expect(casey.owner).to eq(tom)
      expect(spot.owner).to eq(tom)
    end
    
    it "has many appointments" do
      expect(casey.appointments).to include(appointment)
    end

    it "has many invoices" do
      expect(casey.invoices).to include(invoice_one)
    end
  end
end
