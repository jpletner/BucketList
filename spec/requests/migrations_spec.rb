require 'rails_helper'

RSpec.describe "Migrations", type: :request do
  describe "GET /migrations" do
    it "works! (now write some real specs)" do
      get migrations_path
      expect(response).to have_http_status(200)
    end
  end
end
