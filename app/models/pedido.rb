class Pedido < ApplicationRecord
	belongs_to :forma_pagamento
	belongs_to :endereco
  belongs_to :usuario
	has_many :itens_pedido, dependent: :destroy, class_name: "ItemPedido"
  	has_many :itens, through: :itens_pedido
end
