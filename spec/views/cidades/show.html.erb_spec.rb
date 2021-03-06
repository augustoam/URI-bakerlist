require 'rails_helper'

RSpec.describe "cidades/show", type: :view do
  before(:each) do
    @cidade = assign(:cidade, Cidade.create!(
      :nome => "Nome",
      :uf => "Uf"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Uf/)
  end
end
