class Usuarios::SessionsController < Devise::SessionsController
  layout 'login'

  def create
    super
  end

  # Apos concluir o login, direciona para home/show_home
  def after_sign_in_path_for(resource)
    root_path
  end

  def retorna_usuarios
    render json: @usuarios = Usuario.where(confirmation_token: params[:usuario_key])
  end

end
