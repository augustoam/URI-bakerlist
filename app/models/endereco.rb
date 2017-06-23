class Endereco < ApplicationRecord
	belongs_to :cidade
  has_many :pedidos
  has_many :usuarios

  validates :endereco, presence: true
  validates :numero, presence: true
  validates :cep, presence: true
  validates :cidade, presence: true

	def to_s
		"#{endereco}" 
	end
end
