class Unidade < ApplicationRecord
	has_many :itens

  validates :descricao, presence: true

	def to_s
		"#{descricao}" 
	end
end
