class CreateEnderecos < ActiveRecord::Migration[5.0]
  def change
    create_table :enderecos do |t|
      t.string :endereco
      t.integer :numero
      t.string :referencia
      t.string :obs
      t.string :cep
      t.integer :cidade_id

      t.timestamps
    end
  end
end
