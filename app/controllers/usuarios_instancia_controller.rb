class UsuariosInstanciaController < ActionController::API

  def update_usuarios_instancia 
    @usuario_instancia = UsuarioInstancia.find_by(cod_usuario: params[:usuario_instancia][:cod_usuario], instancia_id: params[:usuario_insancia][:instancia])
    unless @usuario_instancia
      UsuarioInstancia.create!(cod_usuario: params[:usuario_instancia][:cod_usuario], instancia: params[:usuario_insancia][:instancia])
    end
  end

  def cria_usuario
    @instancia = Instancia.find_by(id_cliente: params[:id_cliente], id_database: params[:id_database], api_key: params[:api_key])  
    if @instancia
      usuarios = params[:usuarios]
      
      usuarios.each do |usuario|

        if !UsuarioInstancia.find_by(email: usuario['e_mail'], cod_usuario: usuario['codigo'])
          UsuarioInstancia.create!(email: usuario['e_mail'], cod_usuario: usuario['codigo'], instancia: @instancia)
        end
      end
    end
    head :ok
  end

end
