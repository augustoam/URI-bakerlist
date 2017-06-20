class TarefaUsuarioInstancia < ApplicationRecord
  belongs_to :tarefa
  belongs_to :usuario_instancia

  validates :tarefa, presence: true
  validates :usuario_instancia, presence: true

  after_save :update_tarefas
  attr_accessor :radio_buttons, :texto

  def update_tarefas
    if self.respondido == true
      self.tarefa.atualiza_conclusao
    end
  end

  def atualiza_conteudo_resposta(tarefa_params)
    self.update(tarefa_params)
  end
  
end
