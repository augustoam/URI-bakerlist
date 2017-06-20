class CreateTarefasUsuariosInstancia < ActiveRecord::Migration[5.0]
  def change
    create_table :tarefas_usuarios_instancia do |t|
      t.integer :tarefa_id
      t.integer :usuario_instancia_id	
      t.string :conteudo_resposta
      t.boolean :respondido
      t.datetime :data_resposta

      t.timestamps
    end
  end
end
