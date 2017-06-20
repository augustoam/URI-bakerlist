class ReferenceTarefasToInstancias < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :tarefas, :instancias
  end
end
