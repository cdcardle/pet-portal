require 'rails_helper'

RSpec.describe Appointment, type: :model do
  include_examples "create models"

  describe "Model" do
    it "has a date and time" do
      expect(appointment.datetime).to eq(DateTime.parse("2019-01-06T16:30:00"))
      expect(appointment.date).to eq("2019-01-06")
      expect(appointment.time).to eq("4:30pm")
    end
  end

  describe "Associations" do
    it "has a pet" do
      expect(appointment.pet).to eq(pet)
    end

    it "as a doctor" do
      expect(appointment.doctor).to eq(doctor)
    end

    it "has an invoice" do
      expect(appointment.invoice).to eq(invoice)
    end
  end
end
