require 'rails_helper'

RSpec.describe "AdventurePhotos", type: :request do
  describe "GET /adventure_photos" do
    it "works! (now write some real specs)" do
      get adventure_photos_path
      expect(response).to have_http_status(200)
    end
  end
end
