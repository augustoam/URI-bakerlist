require 'rails_helper'

RSpec.describe UsuarioInstancia, type: :model do
  context "validações" do
    it "campos obrigatórios" do
      expect(subject).to validate_presence_of(:instancia)
    end

    it "campos únicos" do
      expect(subject).to_not validate_uniqueness_of(:email).scoped_to(:deleted_at)
    end
  end
end
