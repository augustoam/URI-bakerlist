class Item < ApplicationRecord
	belongs_to :categoria
	belongs_to :unidade
	has_many :itens_pedido
end
