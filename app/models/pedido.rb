class Pedido < ApplicationRecord
	belongs_to :forma_pagamento
	belongs_to :endereco
  belongs_to :usuario
	belongs_to :itens_pedido
end
