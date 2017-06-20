class Amazon
  def atualiza_fila(instancia, identificador_tarefa)
    require 'aws-sdk-rails'

    Aws.use_bundled_cert!
    #Aws.config.update({
    #   credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    #})

    sqs = Aws::SQS::Client.new(
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'sa-east-1'
    )
    #sqs = Aws::SQS::Client.new(region: 'sa-east-1')

    queue = sqs.create_queue({
      queue_name: instancia,
      attributes: {
      "ReceiveMessageWaitTimeSeconds" => "20" # Wait 20 seconds to receive messages.
      },
    })

    resp = sqs.send_message_batch({
      queue_url: queue.queue_url,
      entries: [
        {
          id: '1',
          message_body: '{ 
                          "tarefa": {"identificador_tarefa":"' + identificador_tarefa + '"}' + 
                        '}'
        }
      ],
    })
  end
end
  
