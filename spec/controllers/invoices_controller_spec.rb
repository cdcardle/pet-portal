require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  include_examples "create models"
  let(:invoice_params) {{ cents: 17689, appointment_id: 2 }}
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
    it "creates a new invoice and redirects to its show page if admin" do
      sign_in admin
      Appointment.create(appointment_params)
      expect{
        post :create, params: {invoice: invoice_params}
      }.to change(Invoice, :count).by(1)
      expect(Invoice.last.cents).to eq(17689)
      expect(response).to redirect_to(invoice_path(Invoice.last.id))
    end

    it "does not create invoice and redirects back if user" do
      sign_in user
      expect{
        post :create, params: {invoice: invoice_params}
      }.to_not change(Invoice, :count)
      expect(response).to redirect_to(root_path)
    end

    it "does not create invoice and redirects to sign in if not logged in" do
      expect{
        post :create, params: {invoice: invoice_params}
      }.to_not change(Invoice, :count)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "#show" do
    include_examples "renders if admin", :show, { id: 1 }

    it "renders if it is their invoice as user" do
      sign_in user
      expect(
        get :show, params: {id: 1}
      ).to render_template(:show)
    end

    it "redirects back if it is not their invoice as user" do
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
    it "updates the invoice and redirects to its show page if admin" do
      sign_in admin
      post :update, params: {id: 1, invoice: {cents: 21255}}
      expect(Invoice.find(1).total).to eq("$212.55")
      expect(response).to redirect_to(invoice_path(1))
    end

    it "redirects back if user" do
      sign_in user
      post :update, params: {id: 1, invoice: {cents: 21255}}
      expect(response).to redirect_to(root_path)
    end

    it "redirects to sign in if not logged in" do
      post :update, params: {id: 1, invoice: {cents: 21255}}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "#destroy" do
    it "deletes an invoice and redirects to invoices#index if admin" do
      sign_in admin
      post :create, params: {invoice: invoice_params}
      expect {
        delete :destroy, params: {id: Invoice.last.id}
      }.to change(Invoice, :count).by(-1)
      expect(response).to redirect_to(invoices_path)
    end

    it "does nothing if user" do
      sign_in user
      expect {
        delete :destroy, params: {id: Invoice.last.id}
      }.to_not change(Invoice, :count)
    end

    it "does nothing if not logged in" do
      expect {
        delete :destroy, params: {id: Invoice.last.id}
      }.to_not change(Invoice, :count)
    end
  end
end
