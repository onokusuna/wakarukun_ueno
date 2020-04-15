require 'rails_helper'

RSpec.describe "Exhibitions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/exhibitions/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/exhibitions/show"
      expect(response).to have_http_status(:success)
    end
  end

end
