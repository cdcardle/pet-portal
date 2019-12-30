require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice) { build :invoice }
  let(:appointment) { build appointment }

  it "has a total" do
    expect(invoice.total).to eq(137.43)
  end

  it "has a date" do
    invoice.appointment = appointment
    expect(invoice.date).to eq("2019-12-20")
  end
end
