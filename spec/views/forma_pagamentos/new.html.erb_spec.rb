require 'rails_helper'

RSpec.describe "forma_pagamentos/new", type: :view do
  before(:each) do
    assign(:forma_pagamento, FormaPagamento.new(
      :descricao => "MyString"
    ))
  end

  it "renders new forma_pagamento form" do
    render

    assert_select "form[action=?][method=?]", forma_pagamentos_path, "post" do

      assert_select "input#forma_pagamento_descricao[name=?]", "forma_pagamento[descricao]"
    end
  end
end
