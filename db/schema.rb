# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170622122531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categorias", force: :cascade do |t|
    t.string   "descricao"
    t.string   "imagem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string   "nome"
    t.string   "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string   "endereco"
    t.integer  "numero"
    t.string   "referencia"
    t.string   "obs"
    t.string   "cep"
    t.integer  "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formas_pagamentos", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instancias", force: :cascade do |t|
    t.string   "id_cliente"
    t.string   "dominio_login"
    t.boolean  "acesso_liberado"
    t.string   "api_key"
    t.string   "id_database"
    t.string   "string"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "itens", force: :cascade do |t|
    t.string   "descricao"
    t.binary   "imagem"
    t.float    "preco"
    t.integer  "unidade_id"
    t.integer  "categoria_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "itens_pedido", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "pedido_id"
    t.float    "vl_total"
    t.integer  "quantidade", default: 2
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.datetime "data_entrega"
    t.integer  "hora_entrega"
    t.string   "forma_entrega"
    t.integer  "forma_pagamento_id"
    t.integer  "usuario_id"
    t.integer  "endereco_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "concluido",          default: false
    t.float    "vl_total"
  end

  create_table "tarefas", force: :cascade do |t|
    t.integer  "instancia_id"
    t.string   "usuarios"
    t.text     "conteudo_html"
    t.string   "acoes"
    t.integer  "operador_conclusao"
    t.string   "identificador_agrupamento"
    t.string   "identificador_tarefa"
    t.boolean  "concluida",                 default: false
    t.integer  "tipo_tarefa_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "titulo"
  end

  create_table "tarefas_usuarios_instancia", force: :cascade do |t|
    t.integer  "tarefa_id"
    t.integer  "usuario_instancia_id"
    t.string   "conteudo_resposta"
    t.boolean  "respondido",           default: false
    t.datetime "data_resposta"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "tipos_tarefas", force: :cascade do |t|
    t.string   "id_tipo_tarefa"
    t.integer  "instancia_id"
    t.string   "descricao"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "token"
    t.integer  "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidades", force: :cascade do |t|
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.integer  "endereco_id"
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  create_table "usuarios_instancia", force: :cascade do |t|
    t.string   "email"
    t.integer  "instancia_id"
    t.string   "cod_usuario"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "usuarios_instancia_usuarios", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "usuario_instancia_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_foreign_key "enderecos", "cidades"
  add_foreign_key "itens", "categorias"
  add_foreign_key "itens", "unidades"
  add_foreign_key "itens_pedido", "itens"
  add_foreign_key "itens_pedido", "pedidos"
  add_foreign_key "pedidos", "enderecos"
  add_foreign_key "pedidos", "formas_pagamentos"
  add_foreign_key "pedidos", "usuarios"
  add_foreign_key "tarefas", "instancias"
  add_foreign_key "tarefas", "tipos_tarefas"
  add_foreign_key "tarefas_usuarios_instancia", "tarefas"
  add_foreign_key "tarefas_usuarios_instancia", "usuarios_instancia"
  add_foreign_key "tipos_tarefas", "instancias"
  add_foreign_key "tokens", "usuarios"
  add_foreign_key "usuarios", "enderecos"
  add_foreign_key "usuarios_instancia", "instancias"
  add_foreign_key "usuarios_instancia_usuarios", "usuarios"
  add_foreign_key "usuarios_instancia_usuarios", "usuarios_instancia"
end
