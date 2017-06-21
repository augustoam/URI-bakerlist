module ItemPedidosHelper

  def calcula_total(itens_pedido)
    vl_total = 0
    itens_pedido.each do |item_pedido|
      vl_total += item_pedido.quantidade * item_pedido.item.preco
    end
    vl_total
  end
end
