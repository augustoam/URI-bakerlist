# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Usuario.destroy_all
Usuario.transaction do
  user = Usuario.new(email: 'user@user.com', password: '1')
  user.save(validate: false)
  user.confirm
end
