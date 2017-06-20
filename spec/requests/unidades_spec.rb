require 'rails_helper'

RSpec.describe "Unidades", type: :request do
  describe "GET /unidades" do
    it "works! (now write some real specs)" do
      get unidades_path
      expect(response).to have_http_status(200)
    end
  end
end
