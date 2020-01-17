require 'rails_helper'

RSpec.describe PetsController, type: :controller do

  include_examples "create models"

  describe "#index" do
    it "renders index for admin" do
      sign_in admin
      get :index
      expect(response).to render_template(:index)
    end

    it "redirects back if not admin" do
      expect(
        get :index, params: {headers: {"HTTP_REFERER" => "http://test.host"}}
      ).to redirect_to(root_path)
    end
  end
end
