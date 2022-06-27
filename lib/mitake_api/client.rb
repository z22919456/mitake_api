require 'faraday'
# require 'faraday_middleware'
Faraday.default_adapter = :net_http
module MitakeApi
  class Client
    attr_reader :url, :charset, :mitake_msg, :response

    def initialize(settings)
      @username = settings[:username]
      @password = settings[:password]
      @charset =  settings[:charset] || 'UTF8'
      @callback_url = settings[:callback_url]
      @url = "https://#{settings[:url]&.gsub(%r{https?://}, '')}"
    end

    def send_message(message)
      @mitake_msg = Message.new(message)
      mitake_msg.response = connection.post('api/mtk/SmSend') do |req|
        req.params = { CharsetURL: charset }
        req.headers = { 'Content-Type' => 'application/x-www-form-urlencoded' }
        req.body = URI.encode_www_form(credentials.merge(mitake_msg.to_h))
      end
    end

    private

    def connection
      proxy = ENV['http_proxy'] || ENV['HTTP_PROXY']
      options = { url: url }
      options['proxy'] = proxy if proxy.present?
      @connection ||= Faraday.new(url: url) do |faraday|
        faraday.response :logger
        faraday.response :raise_error
      end
    end

    def credentials
      {
        username: @username,
        password: @password,
        response: @callback_url
      }
    end
  end
end
