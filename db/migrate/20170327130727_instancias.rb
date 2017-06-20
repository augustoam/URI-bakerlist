class Instancias < ActiveRecord::Migration[5.0]
  def change
    create_table :instancias do |t|
      t.string :id_cliente
      t.string :dominio_login
      t.boolean :acesso_liberado
      t.string :api_key
      t.string :id_database, :string

      t.timestamps
    end
  end
end
