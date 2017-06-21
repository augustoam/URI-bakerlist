class HomeController < ApplicationController

  def index
  	if current_usuario.admin?
    	redirect_to pedidos_path
    else
    	redirect_to show_home_home_index_path
    end
  end

  def show_home
  	@categoria = Categoria.all
  end

  def itens
  	@itens = Item.where(categoria_id: params[:categoria_id])
  end

  def carrinho
    pedido = Pedido.find_by(concluido: false, usuario_id: current_usuario.id)
    if pedido 
      @itens_pedido = ItemPedido.where(pedido: pedido)
    else
      pedido = Pedido.create(usuario_id: current_usuario.id)
      @itens_pedido = ItemPedido.where(pedido: pedido)
    end
  end

  def adiciona_carrinho
    pedido = Pedido.find_by(concluido: false, usuario_id: current_usuario.id)
    if pedido
      ItemPedido.create!(pedido_id: pedido.id, item_id: params[:item_id])
    else
      pedido = Pedido.create!(usuario_id: current_usuario.id)
      ItemPedido.create!(pedido_id: pedido.id, item_id: params[:item_id])
    end
    redirect_to itens_home_index_path(categoria_id: params[:categoria_id])
  end

  def info_pedido
    @pedido = Pedido.find_by(concluido: false, usuario_id: current_usuario.id)
  end

  def add_quantidade
    pedido = Pedido.find_by(concluido: false, usuario_id: current_usuario.id)
    item_pedido = ItemPedido.find_by(pedido_id: pedido.id, item_id: params[:item_id])
    item_pedido.update(quantidade: item_pedido.quantidade+1)
    redirect_to carrinho_home_index_path
  end

  def diminui_quantidade
    pedido = Pedido.find_by(concluido: false, usuario_id: current_usuario.id)
    item_pedido = ItemPedido.find_by(pedido_id: pedido.id, item_id: params[:item_id])
    item_pedido.update(quantidade: item_pedido.quantidade-1)
    redirect_to carrinho_home_index_path
  end
end
