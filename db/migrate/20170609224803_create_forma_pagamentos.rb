class CreateFormaPagamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :formas_pagamentos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
