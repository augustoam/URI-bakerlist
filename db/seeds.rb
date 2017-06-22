# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pedido.destroy_all
Item.destroy_all

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

unidade = Unidade.find_by(descricao:'Unidade')
categoria = Categoria.find_by(descricao:'Doces')
Item.transaction do
	Item.create!(descricao:'Brigadeiro', preco:2.40, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Cupcake', preco:5.50, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Bombom', preco:3.60, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Donuts', preco:5.50, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Cajuzinho', preco:2.40, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Beijinho', preco:2.50, categoria: categoria, unidade: unidade)
end

unidade = Unidade.find_by(descricao:'Unidade')
categoria = Categoria.find_by(descricao:'Salgados')
Item.transaction do
	Item.create!(descricao:'Rissole', preco:2.40, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Croquete', preco:5.50, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Pastel', preco:3.60, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Coxinha', preco:5.50, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Cajuzinho', preco:2.40, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Beijinho', preco:2.50, categoria: categoria, unidade: unidade)
end

unidade = Unidade.find_by(descricao:'KG')
categoria = Categoria.find_by(descricao:'Frios')
Item.transaction do
	Item.create!(descricao:'Presunto', preco:2.40, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Queijo', preco:5.50, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Mumu', preco:3.60, categoria: categoria, unidade: unidade)
end

unidade = Unidade.find_by(descricao:'KG')
categoria = Categoria.find_by(descricao:'Pães')
Item.transaction do
	Item.create!(descricao:'Pão de Centeio', preco:2.40, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Pão Sírio', preco:5.50, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Pão de Queijo', preco:3.60, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Pão de Francês', preco:3.60, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Pão de Forma', preco:3.60, categoria: categoria, unidade: unidade)
	Item.create!(descricao:'Bagel', preco:3.60, categoria: categoria, unidade: unidade)
end
