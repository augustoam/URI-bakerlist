json.extract! pedido, :id, :data_entrega, :hora_entrega, :forma_entrega, :forma_pagamento_id, :usuario_id, :endereco_id, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
