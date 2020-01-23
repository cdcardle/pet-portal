require 'rails_helper'

RSpec.describe PetsController, type: :controller do

  include_examples "create models"
  let(:spot) { build(:spot) }
  let(:pet_params) {{name: "Sassy", animal_type: "Cat", breed: "Calico", weight: 13, age: 36, color: "Orange and Brown", gender: "Female"}}

  describe "#index" do
    include_examples "renders if admin", :index
    include_examples "redirects back if user", :index
    include_examples "redirects to sign in if not logged in", :index
  end

  describe "#new" do
    include_examples "renders if admin", :new
    include_examples "redirects back if user", :new
    include_examples "redirects to sign in if not logged in", :new
  end

  describe "#create" do
    it "creates a new pet and redirects to their show page if admin" do
      sign_in admin
      expect{
        post :create, params: {pet: pet_params}
      }.to change(Pet, :count).by(1)
      expect(Pet.last.name).to eq("Sassy")
      expect(response).to redirect_to(pet_path(Pet.last.id))
    end

    it "does not create pet and redirects back if user" do
      sign_in user
      expect{
        post :create, params: {pet: pet_params}
      }.to_not change(Pet, :count)
      expect(response).to redirect_to(root_path)
    end

    it "does not create pet and redirects to sign in if not logged in" do
      expect{
        post :create, params: {pet: pet_params}
      }.to_not change(Pet, :count)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "#show" do
    include_examples "renders if admin", :show, {id: 1}

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

    include_examples "redirects to sign in if not logged in", :show, {id: 1}
  end

  describe "#edit" do
    include_examples "renders if admin", :edit, {id: 1}
    include_examples "redirects back if user", :edit, {id: 1}
    include_examples "redirects to sign in if not logged in", :edit, {id: 1}
  end

  describe "#update" do
    it "updates the pet and redirects to their show page if admin" do
      sign_in admin
      post :update, params: {id: 1, pet: {weight: 55}}
      expect(Pet.find(1).weight).to eq(55)
      expect(response).to redirect_to(pet_path(1))
    end

    it "redirects back if user" do
      sign_in user
      post :update, params: {id: 1, pet: {weight: 55}, headers: {"HTTP_REFERER" => "http://test.host"}}
      expect(response).to redirect_to(root_path)
    end

    it "redirects to sign in if not logged in" do
      post :update, params: {id: 1, pet: {weight: 55}}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "#destroy" do
    it "deletes a pet and redirects to pets#index if admin" do
      sign_in admin
      post :create, params: {pet: pet_params}
      expect {
        delete :destroy, params: {id: Pet.last.id}
      }.to change(Pet, :count).by(-1)
      expect(response).to redirect_to(pets_path)
    end

    it "does nothing if user" do
      sign_in user
      expect {
        delete :destroy, params: {id: Pet.last.id}
      }.to_not change(Pet, :count)
    end

    it "does nothing if not logged in" do
      expect {
        delete :destroy, params: {id: Pet.last.id}
      }.to_not change(Pet, :count)
    end
  end
end
