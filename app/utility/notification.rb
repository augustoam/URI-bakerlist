class Notification
  def pushNotification(token, usuario, msg)
    require 'fcm'
    fcm = FCM.new("AAAACPtu6dw:APA91bEJK-yCCKnFqVYA9bpmzOHiJ6-nawR2ELEK95BTdunaKT_Z1ykJhEqB2Bz5wVm-OZBhaoZu9z0Mx0YZ1nafOAq4F4Ijyufnlh5_VwEaAOVeubuXFuHDcx2fOxXYuDYegWKpXkKf")
    # you can set option parameters in here
    #  - all options are pass to HTTParty method arguments
    #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L29-L60
    #  fcm = FCM.new("my_api_key", timeout: 3)

    registration_ids = [token] # an array of one or more client registration tokens
    options = {
               sound: "default",  
               priority: "high",
                notification: {
                  title: "Parabéns! " + usuario.email,
                  body: msg,
                  icon: "new"
                },
                data: {
                  volume: "3.21.15",
                }
              }

    response = fcm.send(registration_ids, options)
  end
end
