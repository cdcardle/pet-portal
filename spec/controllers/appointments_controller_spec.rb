require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do

  include_examples "create models"
  let(:appointment_params) {{ datetime: "2020-01-23T09:30:00", pet_id: 1, doctor_id: 1 }}

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
    it "creates a new appointment and redirects to its show page if admin" do
      sign_in admin
      expect{
        post :create, params: {appointment: appointment_params}
      }.to change(Appointment, :count).by(1)
      expect(Appointment.last.date).to eq("2020-01-23")
      expect(response).to redirect_to(appointment_path(Appointment.last.id))
    end

    it "does not create appointment and redirects back if user" do
      sign_in user
      expect{
        post :create, params: {appointment: appointment_params}
      }.to_not change(Appointment, :count)
      expect(response).to redirect_to(root_path)
    end

    it "does not create appointment and redirects to sign in if not logged in" do
      expect{
        post :create, params: {appointment: appointment_params}
      }.to_not change(Appointment, :count)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "#show" do
    include_examples "renders if admin", :show, { id: 1 }

    it "renders if it is their appointment as user" do
      sign_in user
      expect(
        get :show, params: {id: 1}
      ).to render_template(:show)
    end

    it "redirects back if it is not their appointment as user" do
      sign_in different_user
      get :show, params: {id: 1}
      expect(response).to redirect_to(root_path)
    end

    include_examples "redirects to sign in if not logged in", :show, { id: 1 }
  end

  describe "#edit" do
    include_examples "renders if admin", :edit, {id: 1}
    include_examples "redirects back if user", :edit, {id: 1}
    include_examples "redirects to sign in if not logged in", :edit, {id: 1}
  end

  describe "#update" do
    it "updates the appointment and redirects to its show page if admin" do
      sign_in admin
      post :update, params: {id: 1, appointment: {datetime: "2020-01-09T11:30:00"}}
      expect(Appointment.find(1).date).to eq("2020-01-09")
      expect(Appointment.find(1).time).to eq("11:30am")
      expect(response).to redirect_to(appointment_path(1))
    end

    include_examples "redirects back if user", :update, {id: 1, appointment: {datetime: "2020-01-09T11:30:00"}}
    include_examples "redirects to sign in if not logged in", :update, {id: 1, appointment: {datetime: "2020-01-09T11:30:00"}}
  end

  describe "#destroy" do
    it "deletes an appointment and redirects to appointments#index if admin" do
      sign_in admin
      post :create, params: {appointment: appointment_params}
      expect {
        delete :destroy, params: {id: Appointment.last.id}
      }.to change(Appointment, :count).by(-1)
      expect(response).to redirect_to(appointments_path)
    end

    it "does nothing if user" do
      sign_in user
      expect {
        delete :destroy, params: {id: Appointment.last.id}
      }.to_not change(Appointment, :count)
    end

    it "does nothing if not logged in" do
      expect {
        delete :destroy, params: {id: Appointment.last.id}
      }.to_not change(Appointment, :count)
    end
  end
end
