module MitakeApi
  class SMSProvider < SMSProvider::Base
    attr_reader :message, :settings

    def initialize(settings)
      @settings = settings
      @url = settings[:url]
      @username = settings[:username]
      @password = settings[:password]
      @callback_url = settings[:callback_url]
    end

    def deliver!(message)
      @message = message
      client = Client.new(url: @url, username: @username, password: @password)
      client.send_message(message)
    end
  end
end
