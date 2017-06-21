class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  before_action :authenticate_usuario!, :set_session_token

  def set_session_token
    if params[:token]
      session[:token] = params[:token]
    end
  end
end
