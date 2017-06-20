class CreateCategoria < ActiveRecord::Migration[5.0]
  def change
    create_table :categorias do |t|
      t.string :descricao
      t.string :imagem

      t.timestamps
    end
  end
end
