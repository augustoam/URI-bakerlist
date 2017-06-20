require 'rails_helper'

RSpec.describe "item_pedidos/new", type: :view do
  before(:each) do
    assign(:item_pedido, ItemPedido.new(
      :item_id => 1,
      :pedido_id => 1
    ))
  end

  it "renders new item_pedido form" do
    render

    assert_select "form[action=?][method=?]", item_pedidos_path, "post" do

      assert_select "input#item_pedido_item_id[name=?]", "item_pedido[item_id]"

      assert_select "input#item_pedido_pedido_id[name=?]", "item_pedido[pedido_id]"
    end
  end
end
