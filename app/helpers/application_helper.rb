module ApplicationHelper 
  def tipos_tarefas_menu
    return TipoTarefa.select(:id_tipo_tarefa, :descricao).where(instancia_id: current_usuario.usuarios_instancia.collect(&:instancia_id)).distinct
  end 

  def count_tarefas(filters = nil)
    if filters != nil
      TarefaUsuarioInstancia.joins(usuario_instancia: :usuarios).where(respondido: filters, Usuario.table_name => {id: current_usuario.id}).count
    else
      TarefaUsuarioInstancia.joins(usuario_instancia: :usuarios).where(Usuario.table_name => {id: current_usuario.id}).count
    end
  end
end
