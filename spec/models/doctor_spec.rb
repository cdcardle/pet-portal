require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doctor) { build :doctor }

  it "has a first and last name" do
    expect(doctor.first_name).to eq("Carol")
    expect(doctor.last_name).to eq("Antique")
  end

  it "responds to name" do
    expect(doctor.name).to eq("Dr. Carol Antique")
  end
end
