require 'rails_helper'

RSpec.describe "ItemPedidos", type: :request do
  describe "GET /item_pedidos" do
    it "works! (now write some real specs)" do
      get item_pedidos_path
      expect(response).to have_http_status(200)
    end
  end
end
