class CidadesController < ApplicationController
  before_action :set_cidade, only: [:show, :edit, :update, :destroy]

  # GET /cidades
  # GET /cidades.json
  def index
    @q = Cidade.ransack(params[:q])
    @cidades = @q.result.order(created_at: :asc)
  end

  # GET /cidades/1
  # GET /cidades/1.json
  def show
  end

  # GET /cidades/new
  def new
    @cidade = Cidade.new
  end

  # GET /cidades/1/edit
  def edit
  end

  # POST /cidades
  # POST /cidades.json
  def create
    @cidade = Cidade.new(cidade_params)

    respond_to do |format|
      if @cidade.save
        format.html { redirect_to @cidade, notice: 'Cidade foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @cidade }
      else
        format.html { render :new }
        format.json { render json: @cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cidades/1
  # PATCH/PUT /cidades/1.json
  def update
    respond_to do |format|
      if @cidade.update(cidade_params)
        format.html { redirect_to @cidade, notice: 'Cidade foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @cidade }
      else
        format.html { render :edit }
        format.json { render json: @cidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cidades/1
  # DELETE /cidades/1.json
  def destroy
    if !Endereco.find_by(cidade: @cidade)
      @cidade.destroy
      respond_to do |format|
        format.html { redirect_to cidades_path, notice: 'Cidade foi excluida com sucesso.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to cidades_path, alert: 'Cidade associada a um endereço, não foi poissível excluir.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cidade
      @cidade = Cidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cidade_params
      params.require(:cidade).permit(:nome, :uf)
    end
end
