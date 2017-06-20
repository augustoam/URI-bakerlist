class TarefasRemotasController < ActionController::API

  def obtem_tarefas_remotas
    if Instancia.find_by(id_cliente: params[:id_cliente], id_database: params[:id_database], api_key: params[:api_key])  
      render json: @tarefas = Tarefa.where(identificador_tarefa: params[:identificador_tarefa])
    else  
      render json: @tarefas = Tarefa.all
    end
  end

  def obtem_respostas_tarefas_remotas
    if Instancia.find_by(id_cliente: params[:id_cliente], id_database: params[:id_database], api_key: params[:api_key])  
      render json: @tarefas = TarefaUsuarioInstancia.select('tarefas.identificador_tarefa', 'usuarios_instancia.cod_usuario', 'tarefas_usuarios_instancia.*').joins(:tarefa, :usuario_instancia).where('tarefas.identificador_tarefa': params[:identificador_tarefa])
    else  
      render json: @tarefas = TarefaUsuarioInstancia.select('tarefas.identificador_tarefa', 'usuarios_instancia.cod_usuario', 'tarefas_usuarios_instancia.*').joins(:tarefa, :usuario_instancia).where('tarefas.identificador_tarefa': params[:identificador_tarefa])
    end
  end

  def new
    @tarefa = Tarefa.new
  end

  def cria_tarefa
    @instancia = Instancia.find_by(id_cliente: params[:id_cliente], id_database: params[:id_database], api_key: params[:api_key])  
    if @instancia
      begin
        identificador_tarefa = SecureRandom.hex(32)
      end while Tarefa.find_by(identificador_tarefa: identificador_tarefa)

      tipo_tarefa = @instancia.tipos_tarefas.find_by(id_tipo_tarefa: params[:tarefa][:id_tipo_tarefa])
      if !tipo_tarefa
        tipo_tarefa = @instancia.tipos_tarefas.create!(id_tipo_tarefa: params[:tarefa][:id_tipo_tarefa], 
                                                       descricao: params[:tarefa][:descricao_tipo_tarefa])
      end
    
      @tarefa = @instancia.tarefas.new(usuarios: params[:tarefa][:usuarios],
                                     conteudo_html: params[:tarefa][:conteudo_html],
                                     acoes: params[:tarefa][:acoes],
                                     operador_conclusao: params[:tarefa][:operador_conclusao],
                                     identificador_tarefa: identificador_tarefa,
                                     tipo_tarefa_id: tipo_tarefa.id,
                                     titulo: params[:tarefa][:titulo])

      if @tarefa.save

        render json: @tarefa, status: :created, location: @tarefa
      else
        render json: @tarefa.errors, status: :unprocessable_entity
      end
    else
      render json: 'Não foi possivel'
    end 
  end

end
