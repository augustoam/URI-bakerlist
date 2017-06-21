require 'rails_helper'

RSpec.describe "forma_entregas/index", type: :view do
  before(:each) do
    assign(:forma_entregas, [
      FormaEntrega.create!(
        :descricao => "Descricao"
      ),
      FormaEntrega.create!(
        :descricao => "Descricao"
      )
    ])
  end

  it "renders a list of forma_entregas" do
    render
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
  end
end
