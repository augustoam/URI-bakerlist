class AddColumnTipoEntregaPedido < ActiveRecord::Migration[5.0]
  def change
  	add_column :pedidos, :vl_total, :float
  end
end
