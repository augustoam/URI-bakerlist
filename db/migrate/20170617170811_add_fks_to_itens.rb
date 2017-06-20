class AddFksToItens < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :itens, :categorias
  	add_foreign_key :itens, :unidades
  end
end
