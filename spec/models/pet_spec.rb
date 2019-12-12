require 'rails_helper'

RSpec.describe Pet, type: :model do
  let(:spot) {
    Pet.new(
      name: "Spot",
      animal_type: "Dog",
      breed: "German Shepherd Dog",
      gender: "Male",
      color: "Black and Tan",
      weight: 50,
      age: 7
    )
  }

  it 'has a name' do
    expect(spot.name).to eq("Spot")
  end

  it 'has an animal_type' do
    expect(spot.animal_type).to eq("Dog")
  end

  it 'has a breed' do
    expect(spot.breed).to eq("German Shepherd Dog")
  end

  it 'has a gender' do
    expect(spot.gender).to eq("Male")
  end

  it 'has a color' do
    expect(spot.color).to eq("Black and Tan")
  end

  it 'has a weight' do
    expect(spot.weight).to eq(50)
  end

  it 'has an age' do
    expect(spot.age).to eq(7)
  end
end 
