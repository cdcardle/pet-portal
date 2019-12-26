require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice) {
    Invoice.new(
      total: 137.43
    )
  }

  let(:appt) {
    Appointment.new(
      datetime: "2019-12-20T16:30:00"
    )
  }

  it "has a total" do
    expect(invoice.total).to eq(137.43)
  end

  it "has a date" do
    invoice.appointment = appt
    expect(invoice.date).to eq("2019-12-20")
  end
end
