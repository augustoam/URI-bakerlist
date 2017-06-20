class UnidadesController < ApplicationController
  before_action :set_unidade, only: [:show, :edit, :update, :destroy]

  # GET /unidades
  # GET /unidades.json
  def index
    @unidades = Unidade.all
  end

  # GET /unidades/1
  # GET /unidades/1.json
  def show
  end

  # GET /unidades/new
  def new
    @unidade = Unidade.new
  end

  # GET /unidades/1/edit
  def edit
  end

  # POST /unidades
  # POST /unidades.json
  def create
    @unidade = Unidade.new(unidade_params)

    respond_to do |format|
      if @unidade.save
        format.html { redirect_to @unidade, notice: 'Unidade foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @unidade }
      else
        format.html { render :new }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidades/1
  # PATCH/PUT /unidades/1.json
  def update
    respond_to do |format|
      if @unidade.update(unidade_params)
        format.html { redirect_to @unidade, notice: 'Unidade foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @unidade }
      else
        format.html { render :edit }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1
  # DELETE /unidades/1.json
  def destroy
    if !Item.find_by(unidade: @unidade)
      @unidade.destroy
      respond_to do |format|
        format.html { redirect_to unidades_path, notice: 'Unidade foi excluida com sucesso.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to unidades_path, alert: 'Unidade associada a uma categoria, não foi possível excluir.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade
      @unidade = Unidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unidade_params
      params.require(:unidade).permit(:descricao)
    end
end
