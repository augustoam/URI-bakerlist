class RespondidoDefaultFalseTarefa < ActiveRecord::Migration[5.0]
  def change
    change_table :tarefas_usuarios_instancia do |t|
      t.change :respondido, :boolean, default: false
    end
  end
end
