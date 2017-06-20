require 'rails_helper'

RSpec.describe "enderecos/index", type: :view do
  before(:each) do
    assign(:enderecos, [
      Endereco.create!(
        :endereco => "Endereco",
        :numero => 2,
        :referencia => "Referencia",
        :obs => "Obs",
        :cep => "Cep",
        :cidade_id => 3
      ),
      Endereco.create!(
        :endereco => "Endereco",
        :numero => 2,
        :referencia => "Referencia",
        :obs => "Obs",
        :cep => "Cep",
        :cidade_id => 3
      )
    ])
  end

  it "renders a list of enderecos" do
    render
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Referencia".to_s, :count => 2
    assert_select "tr>td", :text => "Obs".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
