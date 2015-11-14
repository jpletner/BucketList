require "rails_helper"

RSpec.describe MigrationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/migrations").to route_to("migrations#index")
    end

    it "routes to #new" do
      expect(:get => "/migrations/new").to route_to("migrations#new")
    end

    it "routes to #show" do
      expect(:get => "/migrations/1").to route_to("migrations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/migrations/1/edit").to route_to("migrations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/migrations").to route_to("migrations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/migrations/1").to route_to("migrations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/migrations/1").to route_to("migrations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/migrations/1").to route_to("migrations#destroy", :id => "1")
    end

  end
end
