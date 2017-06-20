require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it "deve validar campos obrigatórios" do
    expect(subject).to validate_presence_of(:email)
  end
end
