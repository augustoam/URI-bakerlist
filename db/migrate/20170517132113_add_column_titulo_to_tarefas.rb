class AddColumnTituloToTarefas < ActiveRecord::Migration[5.0]
  def change
    add_column :tarefas, :titulo, :string
  end
end
