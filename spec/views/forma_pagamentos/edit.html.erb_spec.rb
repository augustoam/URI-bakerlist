require 'rails_helper'

RSpec.describe "forma_pagamentos/edit", type: :view do
  before(:each) do
    @forma_pagamento = assign(:forma_pagamento, FormaPagamento.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit forma_pagamento form" do
    render

    assert_select "form[action=?][method=?]", forma_pagamento_path(@forma_pagamento), "post" do

      assert_select "input#forma_pagamento_descricao[name=?]", "forma_pagamento[descricao]"
    end
  end
end
