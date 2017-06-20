FactoryGirl.define do
  factory :pedido do
    data_entrega "2017-06-17 12:08:19"
    hora_entrega 1
    forma_entrega "MyString"
    forma_pagamento_id 1
    usuario_id 1
    endereco_id 1
  end
end
