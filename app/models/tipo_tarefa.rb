class TipoTarefa < ApplicationRecord
  self.table_name = :tipos_tarefas
  belongs_to :instancia
  has_many :tarefas
end
