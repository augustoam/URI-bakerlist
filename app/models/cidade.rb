class Cidade < ApplicationRecord
	has_many :enderecos
  validates :uf, presence: true
  validates :nome, presence: true

	def to_s
		"#{nome} / #{uf}" 
	end
end
