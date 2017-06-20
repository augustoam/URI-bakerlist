require 'rails_helper'

RSpec.describe "pedidos/index", type: :view do
  before(:each) do
    assign(:pedidos, [
      Pedido.create!(
        :hora_entrega => 2,
        :forma_entrega => "Forma Entrega",
        :forma_pagamento_id => 3,
        :usuario_id => 4,
        :endereco_id => 5
      ),
      Pedido.create!(
        :hora_entrega => 2,
        :forma_entrega => "Forma Entrega",
        :forma_pagamento_id => 3,
        :usuario_id => 4,
        :endereco_id => 5
      )
    ])
  end

  it "renders a list of pedidos" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Forma Entrega".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
