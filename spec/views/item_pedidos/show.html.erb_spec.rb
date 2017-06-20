require 'rails_helper'

RSpec.describe "item_pedidos/show", type: :view do
  before(:each) do
    @item_pedido = assign(:item_pedido, ItemPedido.create!(
      :item_id => 2,
      :pedido_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
