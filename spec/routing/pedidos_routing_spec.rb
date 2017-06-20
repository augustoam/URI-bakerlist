require "rails_helper"

RSpec.describe PedidosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pedidos").to route_to("pedidos#index")
    end

    it "routes to #new" do
      expect(:get => "/pedidos/new").to route_to("pedidos#new")
    end

    it "routes to #show" do
      expect(:get => "/pedidos/1").to route_to("pedidos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pedidos/1/edit").to route_to("pedidos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pedidos").to route_to("pedidos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pedidos/1").to route_to("pedidos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pedidos/1").to route_to("pedidos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pedidos/1").to route_to("pedidos#destroy", :id => "1")
    end

  end
end
