module TarefasHelper
  def constroi_html_acoes(atr, tarefa)
    var = link_to atr, atualiza_conteudos_respostas_path({usuario: params[:usuario_tarefa_id], tarefa: tarefa, resposta: atr}), class: 'btn btn-success' 
    var.html_safe
  end

  def montar_radio_buttons(respostas)
    array = []
    respostas.each do |resposta|
     array << [resposta["value"].to_s, resposta["value"]]
    end
    array
  end

  def return_instancias_usuario
    usuarios_instancias = UsuarioInstancia.joins(:usuarios_instancia_usuarios).where(UsuarioInstanciaUsuario.table_name => {usuario_id: current_usuario.id}).collect(&:instancia_id)
    return Instancia.where(id: usuarios_instancias)
  end

  def link_to_filtros(label, status, empresas, id_tipo_tarefa, style, instancia_id = nil)
    klass = ['btn btn-sm btn-outline']
    klass << "btn-#{style.downcase}"  
    klass << 'active' if (params[:status] == status) && (params[:empresas] == empresas) && (params[:id_tipo_tarefa] == id_tipo_tarefa)

    path = tarefas_path(
      id_tipo_tarefa: id_tipo_tarefa,
      status: status,
      empresas: empresas,
      instancia_id: instancia_id
    )

    link_to label, path, class: klass

  end
end
