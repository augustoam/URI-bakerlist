require 'rails_helper'

RSpec.describe "unidades/new", type: :view do
  before(:each) do
    assign(:unidade, Unidade.new(
      :descricao => "MyString"
    ))
  end

  it "renders new unidade form" do
    render

    assert_select "form[action=?][method=?]", unidades_path, "post" do

      assert_select "input#unidade_descricao[name=?]", "unidade[descricao]"
    end
  end
end
