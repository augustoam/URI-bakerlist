json.extract! item_pedido, :id, :item_id, :pedido_id, :created_at, :updated_at
json.url item_pedido_url(item_pedido, format: :json)
