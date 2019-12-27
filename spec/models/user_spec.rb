require 'rails_helper'

RSpec.describe User, type: :model do
  let(:tom) {
    build(:tom)
  }

  let(:admin) {
    build(:admin)
  }

  let(:spot) {
    Pet.new(
      name: "Spot",
      animal_type: "dog",
      breed: "Beagle",
      weight: 35,
      age: 8,
      color: "brown and white",
      gender: "male"
    )
  }

  let(:sassy) {
    Pet.new(
      name: "Sassy",
      animal_type: "cat",
      breed: "Calico",
      weight: 13,
      age: 36,
      color: "orange and brown",
      gender: "female"
    )
  }

  context "Model" do
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

  context "Associations" do
    before do
      spot.owner = tom
      spot.save
      sassy.owner = tom
      sassy.save
    end
    
    it "has many pets" do
      expect(tom.pets.size).to eq(2)
      expect(tom.pets).to include(sassy)
      expect(tom.pets).to include(spot)
    end
  end
end
