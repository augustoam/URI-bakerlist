class Endereco < ApplicationRecord
	belongs_to :cidade
  has_many :pedidos
  has_many :usuarios

	def to_s
		"#{endereco}" 
	end
end
