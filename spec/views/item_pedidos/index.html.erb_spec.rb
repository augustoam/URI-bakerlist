require 'rails_helper'

RSpec.describe "item_pedidos/index", type: :view do
  before(:each) do
    assign(:item_pedidos, [
      ItemPedido.create!(
        :item_id => 2,
        :pedido_id => 3
      ),
      ItemPedido.create!(
        :item_id => 2,
        :pedido_id => 3
      )
    ])
  end

  it "renders a list of item_pedidos" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
