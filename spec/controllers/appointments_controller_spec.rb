require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do

  include_examples "create models"

  describe "#index" do
    include_examples "renders if admin", :index
    include_examples "redirects back if user", :index
    include_examples "redirects to sign in if not logged in", :index
  end
end
