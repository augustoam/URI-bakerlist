class ConteudosRespostasController < ApplicationController

  def show
  end

  def atualiza
    formatter = Formatter.new
    params[:tarefa_usuario_instancia][:conteudo_resposta] = formatter.conteudo_resposta_formatter(params[:commit], 
                                                                                                  params[:tarefa_usuario_instancia][:radio_buttons],
                                                                                                  params[:tarefa_usuario_instancia][:texto])
    usuario_instancia = UsuarioInstancia.select(:id).joins(:usuarios).where(Usuario.table_name => { id: current_usuario.id }).collect(&:id)
    tarefa_usuario_instancia = TarefaUsuarioInstancia.find_by(tarefa: params[:tarefa], usuario_instancia: usuario_instancia)

    if tarefa_usuario_instancia.respondido != true
      tarefa_usuario_instancia.atualiza_conteudo_resposta(tarefa_params)
      redirect_to tarefas_path(id_tipo_tarefa: params[:tarefa_usuario_instancia][:id_tipo_tarefa], 
                               status: params[:tarefa_usuario_instancia][:status], 
                               empresas: params[:tarefa_usuario_instancia][:empresas]), notice: 'Resposta recebida com sucesso!' 
    else
      redirect_to tarefas_path(id_tipo_tarefa: params[:tarefa_usuario_instancia][:id_tipo_tarefa], 
                               status: params[:tarefa_usuario_instancia][:status], 
                               empresas: params[:tarefa_usuario_instancia][:empresas]), notice: 'Usuário já respondeu!' 
    end     
  end

  private
    def tarefa_params
      params.require(:tarefa_usuario_instancia).permit(:conteudo_resposta, :respondido)
    end
end
