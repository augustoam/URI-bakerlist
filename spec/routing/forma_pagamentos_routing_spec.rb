require "rails_helper"

RSpec.describe FormaPagamentosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/forma_pagamentos").to route_to("forma_pagamentos#index")
    end

    it "routes to #new" do
      expect(:get => "/forma_pagamentos/new").to route_to("forma_pagamentos#new")
    end

    it "routes to #show" do
      expect(:get => "/forma_pagamentos/1").to route_to("forma_pagamentos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/forma_pagamentos/1/edit").to route_to("forma_pagamentos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/forma_pagamentos").to route_to("forma_pagamentos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/forma_pagamentos/1").to route_to("forma_pagamentos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/forma_pagamentos/1").to route_to("forma_pagamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/forma_pagamentos/1").to route_to("forma_pagamentos#destroy", :id => "1")
    end

  end
end
