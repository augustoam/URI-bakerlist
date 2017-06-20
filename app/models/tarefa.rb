class Tarefa < ApplicationRecord
  serialize :usuarios, Array 
  enum operador_conclusao: [:todos, :apenas_um]
  belongs_to :instancia
  belongs_to :tipo_tarefa
  has_many :tarefas_usuarios_instancia, dependent: :destroy, class_name: "TarefaUsuarioInstancia"
  has_many :usuarios_instancia, through: :tarefas_usuarios_instancia
  validates :identificador_tarefa, uniqueness: true, presence: true
  validates :instancia, presence: true
  after_save :update_tarefas_usuarios_instancia
  
 
  def update_tarefas_usuarios_instancia 
    self.usuarios.each do |cod_usuario|
      @usuario_instancia = UsuarioInstancia.find_by(cod_usuario: cod_usuario, instancia_id: self.instancia_id)
      if @usuario_instancia
        unless TarefaUsuarioInstancia.find_by(usuario_instancia: @usuario_instancia, tarefa: self)
          tarefa_usuario_instancia = TarefaUsuarioInstancia.create!(usuario_instancia: @usuario_instancia, tarefa: self)
          @usuario_instancia.usuarios.each do |usuario|
            usuario.notifica_nova_tarefa(self, tarefa_usuario_instancia.id)
          end
        end
      end
    end  
  end

  def atualiza_conclusao  
    @amazon = Amazon.new
    @amazon.atualiza_fila(retorna_instancia, self.identificador_tarefa)
    if self.operador_conclusao == 'apenas_um' ||
      TarefaUsuarioInstancia.where(respondido: :true, tarefa: self).count == TarefaUsuarioInstancia.where(tarefa: self).count
        self.update(concluida: true)  
    end
  end
  
  def retorna_instancia
    return self.instancia.id.to_s + '-' + self.instancia.id_cliente
  end

end
