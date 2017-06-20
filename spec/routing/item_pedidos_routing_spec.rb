require "rails_helper"

RSpec.describe ItemPedidosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_pedidos").to route_to("item_pedidos#index")
    end

    it "routes to #new" do
      expect(:get => "/item_pedidos/new").to route_to("item_pedidos#new")
    end

    it "routes to #show" do
      expect(:get => "/item_pedidos/1").to route_to("item_pedidos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/item_pedidos/1/edit").to route_to("item_pedidos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/item_pedidos").to route_to("item_pedidos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_pedidos/1").to route_to("item_pedidos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_pedidos/1").to route_to("item_pedidos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_pedidos/1").to route_to("item_pedidos#destroy", :id => "1")
    end

  end
end
