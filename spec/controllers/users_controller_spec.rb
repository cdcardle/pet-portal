require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  let(:admin) { build(:admin) }
  include_examples "create models"

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
    before do
      get :new
    end

    it "has a 200 response" do
      expect(response.status).to eq(200)
    end

    it "renders new view if admin" do
      expect(response).to render_template(:new)
    end
  end
end
