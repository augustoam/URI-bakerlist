class AddFksToPedido < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :pedidos, :formas_pagamentos
  end
end
