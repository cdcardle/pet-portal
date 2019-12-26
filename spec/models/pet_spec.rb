require 'rails_helper'

RSpec.describe Pet, type: :model do
  let(:casey) {
    Pet.new(
      name: "Casey",
      animal_type: "Dog",
      breed: "German Shepherd Dog",
      gender: "female",
      color: "Black and Tan",
      weight: 50,
      age: 7
    )
  }

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
