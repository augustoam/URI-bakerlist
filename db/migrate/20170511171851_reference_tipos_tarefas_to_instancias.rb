class ReferenceTiposTarefasToInstancias < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :tipos_tarefas, :instancias
    add_foreign_key :tarefas, :tipos_tarefas
  end
end
