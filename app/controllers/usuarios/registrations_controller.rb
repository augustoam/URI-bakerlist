class Usuarios::RegistrationsController < Devise::RegistrationsController 
  layout 'login'

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?

      # Busca o usuario criado para salvar o token do aparelho celular que encontra-se no parametro da sessão
      usuario = Usuario.find_by(email: params[:usuario][:email]) 
      puts session[:token]
      puts 'HEEEEEEEEEy'
      Usuario.create!(token: session[:token], usuario: usuario)

      # Atribui a UsuarioInstanciaUsuario os usuarios instancia e o proprio usuario.

      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    new_usuario_session_path
  end

end
