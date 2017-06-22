class Pedido < ApplicationRecord
	belongs_to :forma_pagamento
	belongs_to :endereco
  belongs_to :usuario
	has_many :itens_pedido, dependent: :destroy
end
