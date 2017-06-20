class Endereco < ApplicationRecord
	belongs_to :cidade

	def to_s
		"#{endereco}" 
	end
end
