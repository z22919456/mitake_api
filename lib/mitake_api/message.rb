module MitakeApi
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
        key_value = value.split('=')
        hash[key_value[0].underscore.to_sym] = key_value[1]
        if key_value[0] == 'statuscode'
          hash[:response_message] =
            I18n.t(key_value[1], scope: %i[mitake_api status_flag])
        end
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
