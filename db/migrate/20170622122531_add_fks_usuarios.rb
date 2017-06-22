class AddFksUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :endereco_id, :integer
    add_foreign_key :usuarios, :enderecos
  end
end
