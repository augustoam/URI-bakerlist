Rails.application.routes.draw do
  
  
  resources :forma_entregas
  root 'home#index'

  resources :categorias
  
  resources :formas_pagamentos

  resources :cidades

  resources :pedidos
  
  resources :unidades
  
  resources :enderecos

  resources :itens
  
  resources :itens_pedido

  resources :home do
    get :show_home, on: :collection 
    get :itens, on: :collection 
    get :carrinho, on: :collection 
    get :adiciona_carrinho, on: :collection
    get :info_pedido, on: :collection
    get :add_quantidade, on: :collection
    get :diminui_quantidade, on: :collection
  end

  resources :tarefas do
    get :respostas, on: :member
    get :retorna_usuarios, on: :collection
  end

  devise_for :usuarios, controllers: { 
   sessions:      'usuarios/sessions',
   registrations: 'usuarios/registrations',
   confirmations: 'usuarios/confirmations',
   passwords:     'usuarios/passwords' 
  }
  as :usuario do
    get 'confirma_email' => 'usuarios/confirmations#confirma_email', :as => 'confirma_email_confirmations'
    post 'retorna_usuarios' => 'usuarios/sessions#retorna_usuarios', :as => 'retorna_usuarios_sessions'
  end

  resources :usuarios_instancia do
    post :update_usuarios_instancia, on: :collection
    post :cria_usuario, on: :collection
  end
  
  resources :tarefas_usuarios_instancia

  resources :conteudos_respostas do
    post :atualiza, on: :collection
  end

  resources :tarefas_remotas do
    get :obtem_tarefas_remotas, on: :collection
    get :obtem_respostas_tarefas_remotas, on: :collection
    post :cria_tarefa, on: :collection
  end

  resources :instancias do
    get :valida_api_key, on: :collection
  end

end
