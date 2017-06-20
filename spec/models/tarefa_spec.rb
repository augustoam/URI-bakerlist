require 'rails_helper'

RSpec.describe Tarefa, type: :model do 

  let!(:instancia) {create(:instancia)} 

  context "deve valdiar" do
    it "campos obrigatórios" do
      expect(subject).to validate_presence_of(:identificador_tarefa)
      expect(subject).to validate_presence_of(:instancia)
    end

    it "campos únicos" do
      expect(subject).to_not validate_uniqueness_of(:identificador_tarefa).scoped_to(:deleted_at)
    end
  end

  describe "#update_tarefas_usuarios_instancia" do
    let!(:usuario_instancia1) {create(:usuario_instancia, cod_usuario: 'usuario1', instancia: instancia)}
    let!(:usuario_instancia2) {create(:usuario_instancia, cod_usuario: 'usuario2', instancia: instancia)}
    let!(:usuario_instancia3) {create(:usuario_instancia, cod_usuario: 'usuario3', instancia: instancia)}
    
    it "Deve realizar update em tarefas usuarios instancias" do
      expect {
        FactoryGirl.create(:tarefa, usuarios: ['usuario1', 'usuario2', 'usuario3'], instancia: instancia)
      }.to change(TarefaUsuarioInstancia, :count).by(3) 
    end

    it "Não deve realizar update em tarefas usuarios instancias" do
      expect {
        FactoryGirl.create(:tarefa, usuarios: ['usuario4', 'usuario5', 'usuario6'], instancia: instancia)
      }.to change(TarefaUsuarioInstancia, :count).by(0) 
    end

  end

  describe "#atualiza_conclusao" do
    let!(:usuario_instancia7)  {create(:usuario_instancia, cod_usuario: 'usuario7',  instancia: instancia)}
    let!(:usuario_instancia8)  {create(:usuario_instancia, cod_usuario: 'usuario8',  instancia: instancia)}
    let!(:usuario_instancia9)  {create(:usuario_instancia, cod_usuario: 'usuario9',  instancia: instancia)}
    let!(:usuario_instancia10) {create(:usuario_instancia, cod_usuario: 'usuario10', instancia: instancia)}
    let!(:usuario_instancia11) {create(:usuario_instancia, cod_usuario: 'usuario11', instancia: instancia)}
    let!(:usuario_instancia12) {create(:usuario_instancia, cod_usuario: 'usuario12', instancia: instancia)}

    let!(:tarefa_todos)     {create(:tarefa, usuarios:['usuario7',  'usuario8',  'usuario9'],  instancia: instancia, operador_conclusao: 'todos',     identificador_tarefa: 10)}
    let!(:tarefa_apenas_um) {create(:tarefa, usuarios:['usuario10', 'usuario11', 'usuario12'], instancia: instancia, operador_conclusao: 'apenas_um', identificador_tarefa: 11)}

    it "Não Deve atualizar a conclusao da tarefa pois nem todos usuarios responderam" do  
      TarefaUsuarioInstancia.where(tarefa: tarefa_todos, usuario_instancia: usuario_instancia7).update(respondido: true)
      TarefaUsuarioInstancia.where(tarefa: tarefa_todos, usuario_instancia: usuario_instancia8).update(respondido: true)
      TarefaUsuarioInstancia.where(tarefa: tarefa_todos, usuario_instancia: usuario_instancia9).update(respondido: false)
      expect(Tarefa.find(tarefa_todos.id).concluida).to be false
    end

    it "Deve atualizar a conclusao da tarefa apenas quando todos usuarios responderem" do  
      TarefaUsuarioInstancia.where(tarefa: tarefa_todos, usuario_instancia: usuario_instancia7).update(respondido: true)
      TarefaUsuarioInstancia.where(tarefa: tarefa_todos, usuario_instancia: usuario_instancia8).update(respondido: true)
      TarefaUsuarioInstancia.where(tarefa: tarefa_todos, usuario_instancia: usuario_instancia9).update(respondido: true)
      expect(Tarefa.find(tarefa_todos.id).concluida).to be true
    end

    it "Não Deve atualizar a conclusao da tarefa poi nenhum respondeu" do  
      TarefaUsuarioInstancia.where(tarefa: tarefa_apenas_um, usuario_instancia: usuario_instancia10).update(respondido: false)
      TarefaUsuarioInstancia.where(tarefa: tarefa_apenas_um, usuario_instancia: usuario_instancia11).update(respondido: false)
      TarefaUsuarioInstancia.where(tarefa: tarefa_apenas_um, usuario_instancia: usuario_instancia12).update(respondido: false)
      expect(Tarefa.find(tarefa_apenas_um.id).concluida).to be false
    end

    it "Deve atualizar a conclusao da tarefa quando apenas um responder" do  
      TarefaUsuarioInstancia.where(tarefa: tarefa_apenas_um, usuario_instancia: usuario_instancia10).update(respondido: true)
      TarefaUsuarioInstancia.where(tarefa: tarefa_apenas_um, usuario_instancia: usuario_instancia11).update(respondido: false)
      TarefaUsuarioInstancia.where(tarefa: tarefa_apenas_um, usuario_instancia: usuario_instancia12).update(respondido: false)
      expect(Tarefa.find(tarefa_apenas_um.id).concluida).to be true
    end
  end
end
