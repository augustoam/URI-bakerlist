require 'rails_helper'

RSpec.describe "forma_pagamentos/show", type: :view do
  before(:each) do
    @forma_pagamento = assign(:forma_pagamento, FormaPagamento.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
