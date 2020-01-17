require 'rails_helper'

RSpec.describe PetsController, type: :controller do

  include_examples "create models"

  describe "#index" do
    it "renders index for admin" do
      sign_in admin
      get :index
      expect(response).to render_template(:index)
    end


  end
end
