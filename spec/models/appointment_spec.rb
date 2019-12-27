require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appt_one) { build(:appt_one) }

  it "has a date and time" do
    expect(appt_one.datetime).to eq(DateTime.parse("2019-01-06T16:30:00"))
    expect(appt_one.date).to eq("2019-01-06")
    expect(appt_one.time).to eq("4:30pm")
  end
end
