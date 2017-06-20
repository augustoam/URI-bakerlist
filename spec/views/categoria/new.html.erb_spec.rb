require 'rails_helper'

RSpec.describe "categoria/new", type: :view do
  before(:each) do
    assign(:categorium, Categorium.new(
      :descricao => "MyString",
      :imagem => ""
    ))
  end

  it "renders new categorium form" do
    render

    assert_select "form[action=?][method=?]", categoria_path, "post" do

      assert_select "input#categorium_descricao[name=?]", "categorium[descricao]"

      assert_select "input#categorium_imagem[name=?]", "categorium[imagem]"
    end
  end
end
