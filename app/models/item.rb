class Item < ApplicationRecord
	belongs_to :categoria
	belongs_to :unidade
	has_many :itens_pedido, dependent: :destroy, class_name: "ItemPedido"
  	has_many :pedidos, through: :itens_pedido
end
