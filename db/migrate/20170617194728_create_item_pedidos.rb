class CreateItemPedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :itens_pedido do |t|
      t.integer :item_id
      t.integer :pedido_id

      t.timestamps
    end
  end
end
