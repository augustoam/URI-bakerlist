FactoryGirl.define do
  factory :tarefa_usuario_instancia, class: TarefaUsuarioInstancia do
  	association :tarefa
  	association :usuario_instancia
  end
end