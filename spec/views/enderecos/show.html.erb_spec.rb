require 'rails_helper'

RSpec.describe "enderecos/show", type: :view do
  before(:each) do
    @endereco = assign(:endereco, Endereco.create!(
      :endereco => "Endereco",
      :numero => 2,
      :referencia => "Referencia",
      :obs => "Obs",
      :cep => "Cep",
      :cidade_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Endereco/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Referencia/)
    expect(rendered).to match(/Obs/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/3/)
  end
end
