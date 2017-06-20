require 'rails_helper'

RSpec.describe "categoria/edit", type: :view do
  before(:each) do
    @categorium = assign(:categorium, Categorium.create!(
      :descricao => "MyString",
      :imagem => ""
    ))
  end

  it "renders the edit categorium form" do
    render

    assert_select "form[action=?][method=?]", categorium_path(@categorium), "post" do

      assert_select "input#categorium_descricao[name=?]", "categorium[descricao]"

      assert_select "input#categorium_imagem[name=?]", "categorium[imagem]"
    end
  end
end
