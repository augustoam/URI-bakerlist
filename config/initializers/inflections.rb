# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'instancia', 'instancias'
  inflect.irregular 'usuario_instancia_usuario', 'usuarios_instancia_usuarios'
  inflect.irregular 'usuario_instancia', 'usuarios_instancia'
  inflect.irregular 'tarefa_usuario_instancia', 'tarefas_usuarios_instancia' 
  inflect.irregular 'tipo_tarefa', 'tipos_tarefas'  
  inflect.irregular 'categoria', 'categorias'
  inflect.irregular 'forma_pagamento', 'formas_pagamentos'
  inflect.irregular 'item', 'itens' 
  inflect.irregular 'item_pedido', 'itens_pedido'   
end
