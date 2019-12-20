require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doc) {
    Doctor.new(
      first_name: "Will",
      last_name: "Smith"
    )
  }

  it "has a first and last name" do
    expect(doc.first_name).to eq("Will")
    expect(doc.last_name).to eq("Smith")
  end

  it "responds to name" do
    expect(doc.name).to eq("Dr. Will Smith")
  end
end
