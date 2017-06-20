class AddQtdItensPedido < ActiveRecord::Migration[5.0]
  def change
  	add_column :itens_pedido, :vl_total, :float
  	add_column :itens_pedido, :quantidade, :integer, default: 1
  end
end
