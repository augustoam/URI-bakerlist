require 'rails_helper'

RSpec.describe "cidades/edit", type: :view do
  before(:each) do
    @cidade = assign(:cidade, Cidade.create!(
      :nome => "MyString",
      :uf => "MyString"
    ))
  end

  it "renders the edit cidade form" do
    render

    assert_select "form[action=?][method=?]", cidade_path(@cidade), "post" do

      assert_select "input#cidade_nome[name=?]", "cidade[nome]"

      assert_select "input#cidade_uf[name=?]", "cidade[uf]"
    end
  end
end
