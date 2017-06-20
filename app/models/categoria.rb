class Categoria < ApplicationRecord
	has_many :itens
	belongs_to :item_pedido

	def to_s
		"#{descricao}" 
	end
end
