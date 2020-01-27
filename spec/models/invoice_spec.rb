require 'rails_helper'

RSpec.describe Invoice, type: :model do
  include_examples "create models"

  describe "Model" do
    it "has a total" do
      expect(invoice.total).to eq("$137.19")
    end
  end

  describe "Associations" do
    it "has an appointment" do
      expect(invoice.appointment).to eq(appointment)
    end

    it "has a pet" do
      expect(invoice.pet).to eq(pet)
    end

    it "has a payer" do
      expect(invoice.payer).to eq(user)
    end

    it "has a date" do
      invoice.appointment = appointment
      expect(invoice.date).to eq("2019-01-06")
    end
  end
end
