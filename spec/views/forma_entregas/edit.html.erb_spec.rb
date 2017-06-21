require 'rails_helper'

RSpec.describe "forma_entregas/edit", type: :view do
  before(:each) do
    @forma_entrega = assign(:forma_entrega, FormaEntrega.create!(
      :descricao => "MyString"
    ))
  end

  it "renders the edit forma_entrega form" do
    render

    assert_select "form[action=?][method=?]", forma_entrega_path(@forma_entrega), "post" do

      assert_select "input#forma_entrega_descricao[name=?]", "forma_entrega[descricao]"
    end
  end
end
