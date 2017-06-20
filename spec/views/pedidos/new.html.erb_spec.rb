require 'rails_helper'

RSpec.describe "pedidos/new", type: :view do
  before(:each) do
    assign(:pedido, Pedido.new(
      :hora_entrega => 1,
      :forma_entrega => "MyString",
      :forma_pagamento_id => 1,
      :usuario_id => 1,
      :endereco_id => 1
    ))
  end

  it "renders new pedido form" do
    render

    assert_select "form[action=?][method=?]", pedidos_path, "post" do

      assert_select "input#pedido_hora_entrega[name=?]", "pedido[hora_entrega]"

      assert_select "input#pedido_forma_entrega[name=?]", "pedido[forma_entrega]"

      assert_select "input#pedido_forma_pagamento_id[name=?]", "pedido[forma_pagamento_id]"

      assert_select "input#pedido_usuario_id[name=?]", "pedido[usuario_id]"

      assert_select "input#pedido_endereco_id[name=?]", "pedido[endereco_id]"
    end
  end
end
