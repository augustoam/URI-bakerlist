class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.datetime :data_entrega
      t.integer :hora_entrega
      t.string :forma_entrega
      t.integer :forma_pagamento_id
      t.integer :usuario_id
      t.integer :endereco_id

      t.timestamps
    end
  end
end
