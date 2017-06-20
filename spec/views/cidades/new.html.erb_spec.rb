require 'rails_helper'

RSpec.describe "cidades/new", type: :view do
  before(:each) do
    assign(:cidade, Cidade.new(
      :nome => "MyString",
      :uf => "MyString"
    ))
  end

  it "renders new cidade form" do
    render

    assert_select "form[action=?][method=?]", cidades_path, "post" do

      assert_select "input#cidade_nome[name=?]", "cidade[nome]"

      assert_select "input#cidade_uf[name=?]", "cidade[uf]"
    end
  end
end
