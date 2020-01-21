require 'rails_helper'

RSpec.describe PetsController, type: :controller do

  include_examples "create models"
  let(:spot) { build(:spot) }

  describe "#index" do
    it "renders for admin" do
      sign_in admin
      expect(get :index).to render_template(:index)
    end

    it "redirects back if not admin" do
      expect(
        get :new, params: {headers: {"HTTP_REFERER" => "http://test.host"}}
      ).to redirect_to(root_path)
      sign_in user
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
      expect(get :show, params: {id: 1}).to render_template(:show)
    end

    it "renders if logged in as pet's owner" do
      sign_in user
      expect(
        get :show, params: {id: 1}
      ).to render_template(:show)
    end

    it "redirects back if logged in and not the pet's owner" do
      spot.update(user_id: 2)
      sign_in user
      expect(
        get :show, params: {id: 2, headers: {"HTTP_REFERER" => "http://test.host"}}
      ).to redirect_to(root_path)
    end

    it "redirects to sign in if not logged in" do
      expect(
        get :show, params: {id: 1}
      ).to redirect_to(new_user_session_path)
    end
  end
end
