require 'rails_helper'

RSpec.describe PetsController, type: :controller do

  include_examples "create models"

  describe "#index" do
    it "renders for admin" do
      sign_in admin
      expect(get :index).to render_template(:index)
    end

    it "redirects back if not admin" do
      expect(
        get :new, params: {headers: {"HTTP_REFERER" => "http://test.host"}}
      ).to redirect_to(root_path)
    end
  end

  describe "#new" do
    it "renders if admin" do
      sign_in admin
      expect(get :new).to render_template(:new)
    end

    it "redirects back if not admin" do
      expect(
        get :new, params: {headers: {"HTTP_REFERER" => "http://test.host"}}
      ).to redirect_to(root_path)
    end
  end

  describe "#show" do
    it "renders if admin" do
      sign_in admin
      expect(get :show).to render_template(:show)
    end

    it "redirects back if not admin" do
      expect(
        get :show, params: {headers: {"HTTP_REFERER" => "http://test.host"}}
      ).to redirect_to(root_path)
    end
  end
end
