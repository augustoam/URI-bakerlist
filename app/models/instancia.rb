class Instancia < ApplicationRecord
  has_many :usuarios_instancia, dependent: :destroy
  has_many :tarefas, dependent: :destroy
  has_many :tipos_tarefas, dependent: :destroy
  before_save :gera_api_key

  def gera_api_key
    self.api_key ||= SecureRandom.hex(64)
  end
end
