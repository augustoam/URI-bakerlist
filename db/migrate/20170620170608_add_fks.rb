class AddFks < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :itens, :categorias
    add_foreign_key :itens, :unidades
    add_foreign_key :itens_pedido, :itens
  end
end
