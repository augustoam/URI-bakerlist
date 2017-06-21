require 'rails_helper'

RSpec.describe "forma_entregas/new", type: :view do
  before(:each) do
    assign(:forma_entrega, FormaEntrega.new(
      :descricao => "MyString"
    ))
  end

  it "renders new forma_entrega form" do
    render

    assert_select "form[action=?][method=?]", forma_entregas_path, "post" do

      assert_select "input#forma_entrega_descricao[name=?]", "forma_entrega[descricao]"
    end
  end
end
