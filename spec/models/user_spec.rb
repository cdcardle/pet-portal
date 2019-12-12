require 'rails_helper'

RSpec.describe User, type: :model do
  let(:tom) {
      User.new(
      email: "tom_example@yahoo.com",
      password: "examplepassword",
      first_name: "Tom",
      last_name: "Smith",
      first_street_address: "1234 Example Rd.",
      second_street_address: "Apt 201",
      city: "Exampletown",
      state: "Nebraska",
      zipcode: 12345,
      role: 0
    )
  }

  let(:bob) {
    User.new(
      email: "bob_example@yahoo.com",
      password: "examplepass123",
      first_name: "Bob",
      last_name: "Johnson",
      first_street_address: "1234 Example Dr.",
      second_street_address: "Apt 101",
      city: "Exampletown",
      state: "Nebraska",
      zipcode: 12345,
      role: 1)
  }

  let(:joe) {
    User.new(
      email: "joe_example@yahoo.com",
      password: "password456",
      first_name: "Joe",
      last_name: "Brown",
      first_street_address: "7890 Example Dr.",
      city: "Exampletown",
      state: "Nebraska",
      zipcode: 12345,
      role: 2)
  }

  it 'has an email' do
    expect(tom.email).to eq("tom_example@yahoo.com")
  end
  
  it 'has a first name' do
    expect(tom.first_name).to eq("Tom")
  end

  it 'has a last name' do
    expect(tom.last_name).to eq("Smith")
  end

  it 'has a first street address' do
    expect(tom.first_street_address).to eq("1234 Example Rd.")
  end

  it "has a city" do
    expect(tom.city).to eq("Exampletown")
  end

  it 'has a state' do
    expect(tom.state).to eq("Nebraska")
  end

  it 'has a zipcode' do
    expect(tom.zipcode).to eq(12345)
  end

  it "has a role" do
    expect(tom.role).to eq("guest")
    expect(bob.role).to eq("owner")
    expect(joe.role).to eq("admin")
  end

  it "responds to name" do
    expect(tom.name).to eq("Tom Smith")
  end

  it "responds to address with a second street address" do
    expect(tom.address).to eq("1234 Example Rd., Apt 201, Exampletown, Nebraska 12345")
  end

  it "responds to address without a second street address" do
    expect(joe.address).to eq("7890 Example Dr., Exampletown, Nebraska 12345")
  end
end
