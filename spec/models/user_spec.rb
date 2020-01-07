require 'rails_helper'

RSpec.describe User, type: :model do
  let(:admin) { build(:admin) }
  include_examples "create models"

  describe "Model" do
    it 'has an email' do
      expect(user.email).to eq("tom_example@yahoo.com")
    end
    
    it 'has a first name' do
      expect(user.first_name).to eq("Tom")
    end

    it 'has a last name' do
      expect(user.last_name).to eq("Johnson")
    end

    it 'has a first street address' do
      expect(user.first_street_address).to eq("1234 Example Rd.")
    end

    it "has a city" do
      expect(user.city).to eq("Exampletown")
    end

    it 'has a state' do
      expect(user.state).to eq("Example")
    end

    it 'has a zipcode' do
      expect(user.zipcode).to eq(12345)
    end

    it "has a role" do
      expect(user.role).to eq("owner")
      expect(admin.role).to eq("admin")
    end

    it "responds to name" do
      expect(user.name).to eq("Tom Johnson")
    end

    it "responds to address with a second street address" do
      expect(user.address).to eq("1234 Example Rd., Apt 201, Exampletown, Example 12345")
    end

    it "responds to address without a second street address" do
      expect(admin.address).to eq("1234 Example Dr., Exampletown, Example 12345")
    end
  end

  describe "Associations" do
    it "has many pets" do
      expect(user.pets.size).to eq(1)
      expect(user.pets).to include(pet)
    end

    it "has many appointments, through pets" do
      expect(user.appointments).to include(appointment)
    end

    it "has many invoices, through pets" do
      expect(user.invoices).to include(invoice)
    end
  end
end
