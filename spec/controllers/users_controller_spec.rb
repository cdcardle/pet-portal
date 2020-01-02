require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it "GET #index" do
    binding.pry
    get :index
    assert_response :success
  end
end
