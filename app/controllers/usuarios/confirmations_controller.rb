class Usuarios::ConfirmationsController < Devise::ConfirmationsController
  layout 'login'

  def after_confirmation_path_for(resource_name, resource)
    original_token = params[:confirmation_token]
    confirma_email_confirmations_path(confirmation_token: original_token)
  end

  def confirma_email
    original_token = params[:confirmation_token]
    usuario = Usuario.find_by(confirmation_token: original_token)
    

    token = Token.find_by(usuario: usuario)
    if token
      notification = Notification.new
      notification.pushNotification(token.token, usuario, 'Email confirmado')
    end
  end

end
