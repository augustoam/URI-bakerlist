require 'rails_helper'

RSpec.describe TarefaUsuarioInstancia, type: :model do

	let!(:instancia) {create(:instancia)} 

  context "validações" do
    it "campos obrigatórios" do
      expect(subject).to validate_presence_of(:tarefa)
      expect(subject).to validate_presence_of(:usuario_instancia)
    end
  end

  describe "#update_tarefas" do

  end
end
