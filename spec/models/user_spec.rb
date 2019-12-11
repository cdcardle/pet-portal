require 'rails_helper'

RSpec.describe User, type: :model do
  let(:tom) {
      User.new(
      email: "tom12345@yahoo.com",
      password: "password123",
      first_name: "Tom",
      last_name: "Smith",
      street_address_one: "1234 Jackson Rd.",
      state: "Nebraska",
      zipcode: "21756"
    )
  }

  it 'has the correct attributes' do
    expect(tom.valid?).to be(true)
  end
end
