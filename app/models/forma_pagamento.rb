class FormaPagamento < ApplicationRecord
	has_many :pedidos
  validates :descricao, presence: true

	def to_s
		"#{descricao}" 
	end
end
