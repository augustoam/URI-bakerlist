require 'rails_helper'

RSpec.describe "categoria/show", type: :view do
  before(:each) do
    @categorium = assign(:categorium, Categorium.create!(
      :descricao => "Descricao",
      :imagem => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Descricao/)
    expect(rendered).to match(//)
  end
end
