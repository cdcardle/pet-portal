require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do

  include_examples "create models"
  let(:doctor_params) {{ first_name: "John", last_name: "Smith" }}

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
    it "creates a new doctor and redirects to its show page if admin" do
      sign_in admin
      expect{
        post :create, params: {doctor: doctor_params}
      }.to change(Doctor, :count).by(1)
      expect(Doctor.last.name).to eq("Dr. John Smith")
      expect(response).to redirect_to(doctor_path(Doctor.last.id))
    end

    it "does not create doctor and redirects back if user" do
      sign_in user
      expect{
        post :create, params: {doctor: doctor_params}
      }.to_not change(Doctor, :count)
      expect(response).to redirect_to(root_path)
    end

    it "does not create doctor and redirects to sign in if not logged in" do
      expect{
        post :create, params: {doctor: doctor_params}
      }.to_not change(Doctor, :count)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "#show" do
    include_examples "renders if admin", :show, { id: 1 }
    include_examples "redirects back if user", :show, { id: 1 }
    include_examples "redirects to sign in if not logged in", :show, { id: 1 }
  end

  describe "#edit" do
    include_examples "renders if admin", :edit, {id: 1}
    include_examples "redirects back if user", :edit, {id: 1}
    include_examples "redirects to sign in if not logged in", :edit, {id: 1}
  end

  describe "#update" do
    it "updates the doctor and redirects to its show page if admin" do
      sign_in admin
      post :update, params: {id: 1, doctor: {last_name: "Thurston"}}
      expect(Doctor.find(1).name).to eq("Dr. Carol Thurston")
      expect(response).to redirect_to(doctor_path(1))
    end

    it "redirects back if user" do
      sign_in user
      post :update, params: {id: 1, doctor: {last_name: "Thurston"}}
      expect(response).to redirect_to(root_path)
    end

    it "redirects to sign in if not logged in" do
      post :update, params: {id: 1, doctor: {last_name: "Thurston"}}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "#destroy" do
    it "deletes a doctor and redirects to doctors#index if admin" do
      sign_in admin
      post :create, params: {doctor: doctor_params}
      expect {
        delete :destroy, params: {id: Doctor.last.id}
      }.to change(Doctor, :count).by(-1)
      expect(response).to redirect_to(doctors_path)
    end

    it "does nothing if user" do
      sign_in user
      expect {
        delete :destroy, params: {id: Doctor.last.id}
      }.to_not change(Doctor, :count)
    end

    it "does nothing if not logged in" do
      expect {
        delete :destroy, params: {id: Doctor.last.id}
      }.to_not change(Doctor, :count)
    end
  end
end
