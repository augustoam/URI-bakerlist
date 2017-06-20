class TiposTarefas < ActiveRecord::Migration[5.0]
  def change
    create_table :tipos_tarefas do |t|
      t.string :id_tipo_tarefa
      t.integer :instancia_id
      t.string :descricao

      t.timestamps
    end
  end
end
