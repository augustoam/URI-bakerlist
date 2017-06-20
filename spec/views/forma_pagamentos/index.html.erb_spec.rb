require 'rails_helper'

RSpec.describe "forma_pagamentos/index", type: :view do
  before(:each) do
    assign(:forma_pagamentos, [
      FormaPagamento.create!(
        :descricao => "Descricao"
      ),
      FormaPagamento.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of forma_pagamentos" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
