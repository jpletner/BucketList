require "rails_helper"

RSpec.describe AdventuresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/adventures").to route_to("adventures#index")
    end

    it "routes to #new" do
      expect(:get => "/adventures/new").to route_to("adventures#new")
    end

    it "routes to #show" do
      expect(:get => "/adventures/1").to route_to("adventures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/adventures/1/edit").to route_to("adventures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/adventures").to route_to("adventures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/adventures/1").to route_to("adventures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/adventures/1").to route_to("adventures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/adventures/1").to route_to("adventures#destroy", :id => "1")
    end

  end
end
