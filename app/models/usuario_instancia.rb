class UsuarioInstancia < ApplicationRecord
  belongs_to :instancia
  has_many :tarefas_usuarios_instancia, dependent: :destroy, class_name: "TarefaUsuarioInstancia"
  has_many :tarefas, through: :tarefas_usuarios_instancia
  has_many :usuarios_instancia_usuarios, dependent: :destroy
  has_many :usuarios, through: :usuarios_instancia_usuarios
  
  validates :instancia, presence: true 
end
