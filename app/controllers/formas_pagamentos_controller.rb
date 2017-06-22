class FormasPagamentosController < ApplicationController
  before_action :set_forma_pagamento, only: [:show, :edit, :update, :destroy]

  # GET /forma_pagamentos
  # GET /forma_pagamentos.json
  def index
    @q = FormaPagamento.ransack(params[:q])
    @formas_pagamentos = @q.result.order(created_at: :asc)
  end

  # GET /forma_pagamentos/1
  # GET /forma_pagamentos/1.json
  def show
  end

  # GET /forma_pagamentos/new
  def new
    @forma_pagamento = FormaPagamento.new
  end

  # GET /forma_pagamentos/1/edit
  def edit
  end

  # POST /forma_pagamentos
  # POST /forma_pagamentos.json 
  def create
    @forma_pagamento = FormaPagamento.new(forma_pagamento_params)

    respond_to do |format|
      if @forma_pagamento.save
        format.html { redirect_to @forma_pagamento, notice: 'Forma pagamento foi criada com sucesso.' }
        format.json { render :show, status: :created, location: @forma_pagamento }
      else
        format.html { render :new }
        format.json { render json: @forma_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forma_pagamentos/1
  # PATCH/PUT /forma_pagamentos/1.json
  def update
    respond_to do |format|
      if @forma_pagamento.update(forma_pagamento_params)
        format.html { redirect_to @forma_pagamento, notice: 'Forma pagamento foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @forma_pagamento }
      else
        format.html { render :edit }
        format.json { render json: @forma_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forma_pagamentos/1
  # DELETE /forma_pagamentos/1.json
  def destroy
    @forma_pagamento.destroy
    respond_to do |format|
      format.html { redirect_to formas_pagamentos_url, notice: 'Forma pagamento foi excluida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forma_pagamento
      @forma_pagamento = FormaPagamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forma_pagamento_params
      params.require(:forma_pagamento).permit(:descricao)
    end
end
