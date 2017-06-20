class TarefasUsuariosInstanciaController < ApplicationController
  before_action :set_tarefa_usuario_instancia, only: [:show, :update, :destroy, :edit, :atualiza_conteudo_resposta]

  def index
    @tarefa_usuario_instancia = TarefaUsuarioInstancia.order(:tarefa_id)
  end

  def show
    render show: @tarefa_usuario_instancia
  end

  def edit
  end
  
  def update
    params[:data_resposta] = DateTime.now
    if @tarefa_usuario_instancia.update(tarefa_usuario_instancia_params)
      render json: @tarefa_usuario_instancia
    else
      render json: @tarefa_usuario_instancia.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tarefa_usuario_instancia.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarefa_usuario_instancia
      @tarefa_usuario_instancia = TarefaUsuarioInstancia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tarefa_usuario_instancia_params
      params.require(:tarefa_usuario_instancia).permit(:tarefa_id, :usuario_insatncia_id, :conteudo_resposta, :respondido, :data_resposta)
    end


end
