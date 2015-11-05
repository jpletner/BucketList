require 'rails_helper'

RSpec.describe "Adventures", type: :request do
  describe "GET /adventures" do
    it "works! (now write some real specs)" do
      get adventures_path
      expect(response).to have_http_status(200)
    end
  end
end
