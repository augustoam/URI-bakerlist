class UsuarioInstanciaUsuario < ApplicationRecord
  belongs_to :usuario
  belongs_to :usuario_instancia

  validates :usuario, presence: true
  validates :usuario_instancia, presence: true
end
