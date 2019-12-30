require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appointment) { build(:appointment) }

  it "has a date and time" do
    expect(appointment.datetime).to eq(DateTime.parse("2019-01-06T16:30:00"))
    expect(appointment.date).to eq("2019-01-06")
    expect(appointment.time).to eq("4:30pm")
  end
end
