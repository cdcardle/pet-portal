require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:appt) {
    Appointment.new(
      datetime: "2019-12-20T16:30:00"
    )
  }

  it "has a date and time" do
    expect(appt.datetime).to eq(DateTime.parse("2019-12-20T16:30:00"))
    expect(appt.date).to eq("2019-12-20")
    expect(appt.time).to eq("4:30pm")
  end
end
