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
      pedido = Pedido.create(usuario_id: current_usuario.id, vl_total: 0)
      @itens_pedido = ItemPedido.where(pedido: pedido)
    end
  end

  def adiciona_carrinho
    pedido = Pedido.find_by(concluido: false, usuario: current_usuario)
    if !pedido
      pedido = Pedido.create!(usuario: current_usuario)
    end  
    ItemPedido.create!(pedido: pedido, item_id: params[:item_id], quantidade: 1)
    redirect_to itens_home_index_path(categoria_id: params[:categoria_id])
  end

  def info_pedido
    @pedido = Pedido.find_by(concluido: false, usuario_id: current_usuario.id)
    @pedido.update!(vl_total: params[:vl_total])
  end

  def add_quantidade
    item_pedido = ItemPedido.find(params[:id])
    item_pedido.update(quantidade: item_pedido.quantidade+1)
    @itens_pedido = ItemPedido.where(pedido: item_pedido.pedido)
  end

  def diminui_quantidade
    item_pedido = ItemPedido.find(params[:id])
    item_pedido.update(quantidade: item_pedido.quantidade-1, vl_total: item_pedido.quantidade-1 * item_pedido.item.preco)
    @itens_pedido = ItemPedido.where(pedido: item_pedido.pedido)
  end
end
