require 'rails_helper'

RSpec.describe "unidades/edit", type: :view do
  before(:each) do
    @unidade = assign(:unidade, Unidade.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit unidade form" do
    render

    assert_select "form[action=?][method=?]", unidade_path(@unidade), "post" do

      assert_select "input#unidade_descricao[name=?]", "unidade[descricao]"
    end
  end
end
