require "rails_helper"

RSpec.describe FormaEntregasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/forma_entregas").to route_to("forma_entregas#index")
    end

    it "routes to #new" do
      expect(:get => "/forma_entregas/new").to route_to("forma_entregas#new")
    end

    it "routes to #show" do
      expect(:get => "/forma_entregas/1").to route_to("forma_entregas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/forma_entregas/1/edit").to route_to("forma_entregas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/forma_entregas").to route_to("forma_entregas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/forma_entregas/1").to route_to("forma_entregas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/forma_entregas/1").to route_to("forma_entregas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/forma_entregas/1").to route_to("forma_entregas#destroy", :id => "1")
    end

  end
end
