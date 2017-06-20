class Unidade < ApplicationRecord
	has_many :itens

	def to_s
		"#{descricao}" 
	end
end
