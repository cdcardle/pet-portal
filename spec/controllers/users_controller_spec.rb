require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  include_examples "create models"
  let(:user_params) {{email: "bob_example@yahoo.com", password: "bobpassword", first_name: "Bob", last_name: "Johnson", first_street_address: "1234 Example Rd.", second_street_address: "Apt 202", city: "Exampletown", state: "Example", zipcode: 12345, role: "0"}}
  let(:admin_params) {{email: "_example@yahoo.com", password: "bobpassword", first_name: "Bob", last_name: "Johnson", first_street_address: "1234 Example Rd.", second_street_address: "Apt 202", city: "Exampletown", state: "Example", zipcode: 12345, role: "1"}}

  describe "#index" do
    it "renders index view if logged in as admin" do
      sign_in admin
      get :index
      expect(response).to render_template(:index)
    end

    it "redirects back if owner" do
      sign_in user
      get :index, params: {headers: {"HTTP_REFERER" => "http://test.host"}}
      expect(response).to redirect_to(root_path)
    end

    it "redirects back if NOT logged in as admin" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "#new" do
    it "renders new view if logged in as admin" do
      sign_in admin
      get :new
      expect(response).to render_template(:new)
    end

    it "redirects to show page if logged in as owner" do
      sign_in user
      get :new
      expect(response).to redirect_to(user_path(user.id))
    end

    it "renders new view if not logged in" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "creates a new owner user and redirects to new user's show if logged in as admin" do
      sign_in admin
      expect{
        post :create, params: {user: user_params}
      }.to change(User, :count).by(1)
      expect(User.last.role).to eq("owner")
      expect(response).to redirect_to(user_path(User.last.id))
    end

    it "creates a new admin user and redirects to new user's show if logged in as admin" do
      sign_in admin
      expect{
        post :create, params: {user: admin_params}
      }.to change(User, :count).by(1)
      expect(User.last.role).to eq("admin")
      expect(response).to redirect_to(user_path(User.last.id))
    end

    it "creates a new owner user, logs them in, and redirects to new user's show view if not logged in" do
      expect{
        post :create, params: {user: user_params}
      }.to change(User, :count).by(1)
      expect(response).to redirect_to(user_path(User.last.id))
    end
  end

  describe "#show" do
    describe "own show page" do
      it "renders if logged in as admin" do
        sign_in admin
        get :show, params: {id: admin.id}
        expect(response).to render_template(:show)
      end

      it "renders if logged in as owner" do
        sign_in user
        get :show, params: {id: user.id}
        expect(response).to render_template(:show)
      end
    end

    describe "others' show page" do
      it "renders if logged in as admin" do
        sign_in admin
        get :show, params: {id: user.id}
        expect(response).to render_template(:show)
      end

      it "redirects to own show page if logged in as owner" do
        sign_in user
        get :show, params: {id: 1}
        expect(response).to redirect_to(user_path(user.id))
      end

      it "redirects to sign in if not logged in" do
        get :show, params: {id: 1}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#edit" do
    describe "own edit page" do
      it "renders if logged in as admin" do
        sign_in admin
        get :edit, params: {id: admin.id}
        expect(response).to render_template(:edit)
      end

      it "renders if logged in as owner" do
        sign_in user
        get :edit, params: {id: user.id}
        expect(response).to render_template(:edit)
      end
    end
    
    describe "others' edit page" do
      it "renders if logged in as admin" do
        sign_in admin
        get :edit, params: {id: user.id}
        expect(response).to render_template(:edit)
      end

      it "redirects to own show page if logged in as owner" do
        sign_in user
        get :edit, params: {id: 1}
        expect(response).to redirect_to(user_path(user.id))
      end

      it "redirects to sign in if not logged in" do
        get :edit, params: {id: 1}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#update" do
    it "updates a user and redirects to that user's show page if logged in as admin" do
      sign_in admin
      post :update, params: {id: user.id, user: {zipcode: 11111}}
      expect(User.find(user.id).zipcode).to eq(11111)
      expect(response).to redirect_to(user_path(user))
    end

    it "updates an admin and redirects to that admin's show page if logged in as admin" do
      sign_in admin
      post :update, params: {id: admin.id, user: {zipcode: 11111}}
      expect(User.find(admin.id).zipcode).to eq(11111)
      expect(response).to redirect_to(user_path(admin))
    end

    it "updates their own account and redirects to their show page if logged in as user" do
      sign_in user
      post :update, params: {id: user.id, user: {zipcode: 55555}}
      expect(User.find(user.id).zipcode).to eq(55555)
      expect(response).to redirect_to(user_path(user))
    end
  end

  describe "#destroy" do
    it "deletes a user and redirects to index if admin" do
      sign_in admin
      post :create, params: {user: user_params}
      expect {
        delete :destroy, params: {id: User.last.id}
      }.to change(User, :count).by(-1)
      expect(response).to redirect_to(users_path)
    end

    it "deletes nothing and redirects to root if user" do
      sign_in user
      expect {
        delete :destroy, params: {id: User.last.id}
      }.to_not change(User, :count)
      expect(response).to redirect_to(root_path)
    end

    it "deletes nothing and redirects to root if not logged in" do
      expect {
        delete :destroy, params: {id: User.last.id}
      }.to_not change(User, :count)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end