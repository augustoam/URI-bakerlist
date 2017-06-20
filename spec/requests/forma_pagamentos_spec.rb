require 'rails_helper'

RSpec.describe "FormaPagamentos", type: :request do
  describe "GET /forma_pagamentos" do
    it "works! (now write some real specs)" do
      get forma_pagamentos_path
      expect(response).to have_http_status(200)
    end
  end
end
