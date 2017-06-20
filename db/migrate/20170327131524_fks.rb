class Fks < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :usuarios_instancia, :instancias
    add_foreign_key :tokens, :usuarios
  end
end
