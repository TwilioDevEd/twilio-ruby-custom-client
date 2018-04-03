# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
require 'dotenv/load'

# Your Account Sid and Auth Token from twilio.com/console
account_sid = ENV['ACCOUNT_SID']
auth_token = ENV['AUTH_TOKEN']

# Custom HTTP Client
class MyRequestClass
  def initialize()
    @http = Twilio::HTTP::Client.new
  end

  def request(host, port, method, url, params = {}, data = {}, headers = {}, auth = nil, timeout = nil)
    # Here you can change the URL, headers and other request parameters
    # In this case, the request reads env variables HTTP_PROXY
    # and HTTPS_PROXY to use a corporate proxy
    @http.request(
          host,
          port,
          method,
          url,
          params,
          data,
          headers,
          auth,
          timeout
        )
  end  
end  

my_request_client = MyRequestClass.new

@client = Twilio::REST::Client.new(account_sid, auth_token, 
                                    nil, nil, my_request_client)

message = @client.messages
  .create(
     to: '+15558675310',
     body: 'Hey there!',
     from: '+15017122661'
   )

puts "Message SID: #{message.sid}"
