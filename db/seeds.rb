# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Usuario.destroy_all
Usuario.transaction do
  user = Usuario.new(email: 'admin', password: '123456', admin: true)
  user.save(validate: false)
  user.confirm
end

Cidade.destroy_all
Cidade.transaction do
	Cidade.create!(nome: 'Erechim', uf: 'RS')
	Cidade.create!(nome: 'Barão de Cotegipe', uf: 'RS')
	Cidade.create!(nome: 'Gaurama', uf: 'RS')
	Cidade.create!(nome: 'Curitiba', uf: 'PR')
	Cidade.create!(nome: 'Lages', uf: 'SC')
end

Unidade.destroy_all
Unidade.transaction do
	Unidade.create!(descricao: 'KG')
	Unidade.create!(descricao: 'Pacote')
	Unidade.create!(descricao: 'Unidade')
	Unidade.create!(descricao: 'Caixa')
	Unidade.create!(descricao: 'Litro')
	Unidade.create!(descricao: 'Mililitro')
	Unidade.create!(descricao: 'Grama')
end

FormaPagamento.destroy_all
FormaPagamento.transaction do
	FormaPagamento.create!(descricao: 'A Vista')
	FormaPagamento.create!(descricao: 'A Prazo')
	FormaPagamento.create!(descricao: 'Cartão')
end

Categoria.destroy_all
Categoria.transaction do
	Categoria.create!(descricao: 'Doces')
	Categoria.create!(descricao: 'Salgados')
	Categoria.create!(descricao: 'Frios')
	Categoria.create!(descricao: 'Bebidas')
	Categoria.create!(descricao: 'Lanches')
	Categoria.create!(descricao: 'Pães')
	Categoria.create!(descricao: 'Bolos e Tortas')
end
