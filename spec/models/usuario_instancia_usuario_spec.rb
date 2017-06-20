require 'rails_helper'

RSpec.describe UsuarioInstanciaUsuario, type: :model do
  it "deve validar campos obrigatórios" do
    expect(subject).to validate_presence_of(:usuario)
    expect(subject).to validate_presence_of(:usuario_instancia)
  end
end
