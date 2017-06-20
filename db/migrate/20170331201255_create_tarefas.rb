class CreateTarefas < ActiveRecord::Migration[5.0]
  def change
    create_table :tarefas do |t|
      t.integer :instancia_id
      t.string :usuarios
      t.text :conteudo_html
      t.string :acoes
      t.integer :operador_conclusao
      t.string :identificador_agrupamento
      t.string :identificador_tarefa
      t.boolean :concluida, default: false
      t.integer :tipo_tarefa_id

      t.timestamps
    end
  end
end
