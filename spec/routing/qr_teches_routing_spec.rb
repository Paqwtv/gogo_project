require "rails_helper"

RSpec.describe QrTechesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/qr_teches").to route_to("qr_teches#index")
    end

    it "routes to #new" do
      expect(:get => "/qr_teches/new").to route_to("qr_teches#new")
    end

    it "routes to #show" do
      expect(:get => "/qr_teches/1").to route_to("qr_teches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/qr_teches/1/edit").to route_to("qr_teches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/qr_teches").to route_to("qr_teches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/qr_teches/1").to route_to("qr_teches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/qr_teches/1").to route_to("qr_teches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/qr_teches/1").to route_to("qr_teches#destroy", :id => "1")
    end

  end
end
