class CategoriasController < ApplicationController
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]

  def index
    @q = Categoria.ransack(params[:q])
    @categorias = @q.result.order(created_at: :asc)
  end

  def show
  end

  def new
    @categoria = Categoria.new
  end

  def edit
  end

  def create
    @categoria = Categoria.new(categoria_params)

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to @categoria, notice: 'categoria foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @categoria }
      else
        format.html { render :new }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @categoria.update(categoria_params)
        format.html { redirect_to @categoria, notice: 'categoria foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @categoria }
      else
        format.html { render :edit }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if !Item.find_by(categoria: @categoria)
      @categoria.destroy
      respond_to do |format|
        format.html { redirect_to categorias_path, notice: 'categoria foi excluida com sucesso.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
      format.html { redirect_to categorias_path, alert: 'categoria associada a um item, não foi possível excluir.' } 
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria
      @categoria = Categoria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_params
      params.require(:categoria).permit(:descricao, :imagem)
    end
end
