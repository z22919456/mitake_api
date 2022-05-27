module Mitake
  class Message
    attr_reader :message

    def initialize(message)
      @message = message
    end

    def response=(response)
      @response = response
      message.response = self.response
    end

    def response
      response_arr = @response.body.split(/[\r\n]+/)
      hash = {}
      hash[:uuid] = response_arr.shift.gsub(/\[|\]/, '')
      response_arr.each do |value|
        keyValue = value.split('=')
        hash[keyValue[0].underscore.to_sym] = value[1]
      end
      hash
    end

    def to_h
      {
        dstaddr: message.to,
        dlvtime: message.deliver_at || '',
        smbody: message.content,
        clientid: message.uuid
      }
    end
  end
end
