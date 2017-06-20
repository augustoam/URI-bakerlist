class Usuario < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :email, presence: true
  has_many :tokens, dependent: :destroy
  has_many :usuarios_instancia_usuarios, dependent: :destroy
  has_many :usuarios_instancia, through: :usuarios_instancia_usuarios
  has_many :tarefas_usuarios_instancia, through: :usuarios_instancia

  def notifica_nova_tarefa(tarefa, tarefa_usuario_instancia)
    self.tokens.each do |token|
      @notification = Notification.new
      @notification.pushNotification(token.token, self, retorna_link(tarefa, tarefa_usuario_instancia))
    end
  end 

  def retorna_link(tarefa, tarefa_usuario_instancia)
    return 'https://server-authenticate.herokuapp.com/tarefas/' + tarefa.id.to_s +  '/respostas?status=todas&empresas=todas&id_tipo_tarefa=todas'
  end
end

