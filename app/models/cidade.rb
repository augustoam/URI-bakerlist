class Cidade < ApplicationRecord
	has_many :enderecos

	def to_s
		"#{nome} / #{uf}" 
	end
end
