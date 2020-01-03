require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  let(:appointment) { build(:appointment) }
  let(:pet) { build(:pet) }
  let(:user) { build(:user) }
  let(:invoice) { build(:invoice) }
  let(:doctor) { build(:doctor) }

  describe "GET #index" do
    before do
      get :index
    end

    it "has a 200 response" do
      expect(response.status).to eq(200)
    end

    it "has a list of users" do
      expect(response.body).to include()
    end
  end

  describe "GET #new" do
    it "has a form for a new user" do

    end
  end
end
