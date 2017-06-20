class AddColumnPedidos < ActiveRecord::Migration[5.0]
  def change
  	add_column :pedidos, :concluido, :boolean, default: false
  end
end
