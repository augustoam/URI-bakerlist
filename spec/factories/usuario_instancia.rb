FactoryGirl.define do
  factory :usuario_instancia, class: UsuarioInstancia do
  	sequence(:email) {|n| "wonder#{n}@wonder.com"} 
  	association :instancia 
  	sequence(:cod_usuario) {|n| "usuario#{n}"}
  end
end
