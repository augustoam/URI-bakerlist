class Itens < ActiveRecord::Migration[5.0]
  def change
    create_table :itens do |t|
      t.string   :descricao
      t.binary   :imagem
      t.float    :preco
      t.integer  :unidade_id
      t.integer  :categoria_id
      t.timestamps
    end
  end
end
