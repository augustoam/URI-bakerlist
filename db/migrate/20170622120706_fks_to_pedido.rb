class FksToPedido < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :pedidos, :usuarios
    add_foreign_key :pedidos, :enderecos
  end
end
