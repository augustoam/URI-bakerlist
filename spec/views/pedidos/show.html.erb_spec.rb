require 'rails_helper'

RSpec.describe "pedidos/show", type: :view do
  before(:each) do
    @pedido = assign(:pedido, Pedido.create!(
      :hora_entrega => 2,
      :forma_entrega => "Forma Entrega",
      :forma_pagamento_id => 3,
      :usuario_id => 4,
      :endereco_id => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Forma Entrega/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
