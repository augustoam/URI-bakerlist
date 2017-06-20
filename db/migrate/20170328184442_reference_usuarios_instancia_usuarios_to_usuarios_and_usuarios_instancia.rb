class ReferenceUsuariosInstanciaUsuariosToUsuariosAndUsuariosInstancia < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :usuarios_instancia_usuarios, :usuarios
  	add_foreign_key :usuarios_instancia_usuarios, :usuarios_instancia
  end
end
