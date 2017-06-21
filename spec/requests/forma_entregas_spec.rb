require 'rails_helper'

RSpec.describe "FormaEntregas", type: :request do
  describe "GET /forma_entregas" do
    it "works! (now write some real specs)" do
      get forma_entregas_path
      expect(response).to have_http_status(200)
    end
  end
end
