require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  let(:admin) { build(:admin) }
  let(:user) { build(:user) }
  let(:pet) { build(:pet) }
  let(:appointment) { build(:appointment) }
  let(:invoice) { build(:invoice) }
  let(:doctor) { build(:doctor) }

  before do
    pet.owner = user
    pet.save

    appointment.pet = pet
    appointment.doctor = doctor
    appointment.save

    invoice.appointment = appointment
    invoice.save
  end

  describe "GET #index" do
    before do
      get :index
    end

    it "has a 200 response" do
      expect(response.status).to eq(200)
    end

    it "has a list of owners" do
      expect(response.body).to include(user.name)
    end
  end

  describe "GET #new" do
    it "has a 200 response" do
      expect(response.status).to eq(200)
    end

    it "has a form for a new user" do
      expect(response.body).to include("Email Address:")
    end
  end
end
