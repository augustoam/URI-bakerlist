class ReferenceTarefasUsuariosInstanciaToTarefasAndUsuariosInstancia < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :tarefas_usuarios_instancia, :tarefas
  	add_foreign_key :tarefas_usuarios_instancia, :usuarios_instancia
  end
end
