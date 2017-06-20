FactoryGirl.define do
  factory :tarefa, class: Tarefa do
    usuarios ['usuario1', 'usuario2', 'usuario3']
    association :instancia
    identificador_tarefa 1
  end
end
