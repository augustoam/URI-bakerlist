require 'rails_helper'

RSpec.describe "forma_entregas/show", type: :view do
  before(:each) do
    @forma_entrega = assign(:forma_entrega, FormaEntrega.create!(
      :descricao => "Descricao"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
  end
end
