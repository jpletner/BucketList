require "rails_helper"

RSpec.describe AdventurePhotosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/adventure_photos").to route_to("adventure_photos#index")
    end

    it "routes to #new" do
      expect(:get => "/adventure_photos/new").to route_to("adventure_photos#new")
    end

    it "routes to #show" do
      expect(:get => "/adventure_photos/1").to route_to("adventure_photos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/adventure_photos/1/edit").to route_to("adventure_photos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/adventure_photos").to route_to("adventure_photos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/adventure_photos/1").to route_to("adventure_photos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/adventure_photos/1").to route_to("adventure_photos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/adventure_photos/1").to route_to("adventure_photos#destroy", :id => "1")
    end

  end
end
