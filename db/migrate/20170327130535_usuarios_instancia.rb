class UsuariosInstancia < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios_instancia do |t|
      t.string :email
      t.integer :instancia_id
      t.string :cod_usuario
      
      t.timestamps
    end
  end
end
