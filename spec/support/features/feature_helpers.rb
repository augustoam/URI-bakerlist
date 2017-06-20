require 'spec_helper'
include Warden::Test::Helpers
include ActionView::Helpers::NumberHelper
include ApplicationHelper

module FeatureHelpers
  def login(usuario)
    login_as usuario, scope: :usuario
  end

  def usuario
    Usuario.first
  end
end