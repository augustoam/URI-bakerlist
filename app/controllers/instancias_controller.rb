class InstanciasController < ActionController::API
  
  def valida_api_key
    if params[:id_cliente] && params[:id_database] 
      wonder_crypt = WonderRailsHelpers::WonderCrypt.new(key: ENV['KEY_CRYPT'], method: ENV['METHOD_CRYPT'])
      id_cliente   = wonder_crypt.decrypt(params[:id_cliente])
      id_database  = wonder_crypt.decrypt(params[:id_database])

      instancia = Instancia.find_by(id_cliente: id_cliente, id_database: id_database)
      if !instancia
        instancia = Instancia.create!(id_cliente: id_cliente, id_database: id_database)
      end
      render json: instancia
    else
      render json: 'id_cliente e id_database nulos',  status: :unprocessable_entity
    end
  end

end
