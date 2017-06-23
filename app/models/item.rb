class Item < ApplicationRecord
	belongs_to :categoria
	belongs_to :unidade
	has_many :itens_pedido
  validates :descricao, presence: true
  validates :preco, presence: true
  validates :unidade, presence: true
  validates :categoria, presence: true
end
