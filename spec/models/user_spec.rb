require 'rails_helper'

RSpec.describe User, type: :model do
  let(:tom) { build(:tom) }
  let(:admin) { build(:admin) }
  let(:casey) { build(:casey) }
  let(:appointment) { build(:appointment) }
  let(:invoice) { build(:invoice) }
  let(:doctor) { build(:doctor) }

  describe "Model" do
    it 'has an email' do
      expect(tom.email).to eq("tom_example@yahoo.com")
    end
    
    it 'has a first name' do
      expect(tom.first_name).to eq("Tom")
    end

    it 'has a last name' do
      expect(tom.last_name).to eq("Johnson")
    end

    it 'has a first street address' do
      expect(tom.first_street_address).to eq("1234 Example Rd.")
    end

    it "has a city" do
      expect(tom.city).to eq("Exampletown")
    end

    it 'has a state' do
      expect(tom.state).to eq("Example")
    end

    it 'has a zipcode' do
      expect(tom.zipcode).to eq(12345)
    end

    it "has a role" do
      expect(tom.role).to eq("owner")
      expect(admin.role).to eq("admin")
    end

    it "responds to name" do
      expect(tom.name).to eq("Tom Johnson")
    end

    it "responds to address with a second street address" do
      expect(tom.address).to eq("1234 Example Rd., Apt 201, Exampletown, Example 12345")
    end

    it "responds to address without a second street address" do
      expect(admin.address).to eq("1234 Example Dr., Exampletown, Example 12345")
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

    it "has many pets" do
      expect(tom.pets.size).to eq(1)
      expect(tom.pets).to include(casey)
    end

    it "has many appointments, through pets" do
      expect(tom.appointments).to include(appointment)
    end

    it "has many invoices, through pets" do
      expect(tom.invoices).to include(invoice)
    end
  end
end
