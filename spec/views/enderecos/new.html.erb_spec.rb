require 'rails_helper'

RSpec.describe "enderecos/new", type: :view do
  before(:each) do
    assign(:endereco, Endereco.new(
      :endereco => "MyString",
      :numero => 1,
      :referencia => "MyString",
      :obs => "MyString",
      :cep => "MyString",
      :cidade_id => 1
    ))
  end

  it "renders new endereco form" do
    render

    assert_select "form[action=?][method=?]", enderecos_path, "post" do

      assert_select "input#endereco_endereco[name=?]", "endereco[endereco]"

      assert_select "input#endereco_numero[name=?]", "endereco[numero]"

      assert_select "input#endereco_referencia[name=?]", "endereco[referencia]"

      assert_select "input#endereco_obs[name=?]", "endereco[obs]"

      assert_select "input#endereco_cep[name=?]", "endereco[cep]"

      assert_select "input#endereco_cidade_id[name=?]", "endereco[cidade_id]"
    end
  end
end
