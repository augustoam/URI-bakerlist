require 'rails_helper'

RSpec.describe "item_pedidos/edit", type: :view do
  before(:each) do
    @item_pedido = assign(:item_pedido, ItemPedido.create!(
      :item_id => 1,
      :pedido_id => 1
    ))
  end

  it "renders the edit item_pedido form" do
    render

    assert_select "form[action=?][method=?]", item_pedido_path(@item_pedido), "post" do

      assert_select "input#item_pedido_item_id[name=?]", "item_pedido[item_id]"

      assert_select "input#item_pedido_pedido_id[name=?]", "item_pedido[pedido_id]"
    end
  end
end
