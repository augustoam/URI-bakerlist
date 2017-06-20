class AddFksItensPedido < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :itens_pedido, :pedidos
  end
end
