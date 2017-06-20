class ReferenceEnderecoToCidade < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :enderecos, :cidades
  end
end
