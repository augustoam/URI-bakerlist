class FormaPagamento < ApplicationRecord
	has_many :pedidos

	def to_s
		"#{descricao}" 
	end
end
