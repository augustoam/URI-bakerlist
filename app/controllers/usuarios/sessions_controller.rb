class Usuarios::SessionsController < Devise::SessionsController
  layout 'login'

  def create
    @usuario = Usuario.find_by(email: params[:usuario][:email]) 
    if @usuario && session[:token]
      token = @usuario.tokens.find_by(token: session[:token]) 
      unless token
        @token = @usuario.tokens.new(token: session[:token])
        @token.save
      end
    end
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
