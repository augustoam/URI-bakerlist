class TarefasController < ApplicationController
  before_action :set_tarefa, only: [:respostas]

  def respostas
    @tarefa_usuario_instancia = TarefaUsuarioInstancia.new
  end

  def index
    current_usuario.usuarios_instancia
    @tarefas = Tarefa.all
    
    @tarefas = @tarefas.joins(:tipo_tarefa).where(tipos_tarefas: {id_tipo_tarefa: params[:id_tipo_tarefa]}) if params[:id_tipo_tarefa] != 'todas'
    
    @tarefas = @tarefas.where(instancia_id: params[:instancia_id]) if params[:instancia_id]

    @tarefas_usuario_instancia = current_usuario.tarefas_usuarios_instancia.where(tarefa: @tarefas)
    case params[:status]
    when 'concluidas' then @tarefas_usuario_instancia = @tarefas_usuario_instancia.where(respondido: true)
    when 'pendentes'  then @tarefas_usuario_instancia = @tarefas_usuario_instancia.where(respondido: false)
    end
 
  end

  def retorna_usuarios
    render json: @usuarios = Usuario.where(id: current_usuario)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa
      @tarefa = Tarefa.find(params[:id])
    end
end
