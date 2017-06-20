class CreateUsuariosInstanciaUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios_instancia_usuarios do |t|
      t.integer :usuario_id
      t.integer :usuario_instancia_id

      t.timestamps
    end
  end
end
