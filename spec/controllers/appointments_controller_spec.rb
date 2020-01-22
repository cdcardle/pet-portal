require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do

  include_examples "create models"

  describe "#index" do
    it "renders if admin" do
      sign_in admin
      expect(get :index).to render_template(:index)
    end
  end
end
