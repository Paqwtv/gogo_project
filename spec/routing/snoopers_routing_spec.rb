require "rails_helper"

RSpec.describe SnoopersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/snoopers").to route_to("snoopers#index")
    end

    it "routes to #new" do
      expect(:get => "/snoopers/new").to route_to("snoopers#new")
    end

    it "routes to #show" do
      expect(:get => "/snoopers/1").to route_to("snoopers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/snoopers/1/edit").to route_to("snoopers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/snoopers").to route_to("snoopers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/snoopers/1").to route_to("snoopers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/snoopers/1").to route_to("snoopers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/snoopers/1").to route_to("snoopers#destroy", :id => "1")
    end

  end
end
