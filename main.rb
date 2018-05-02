# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
require 'dotenv/load'

# Custom HTTP Client
require_relative 'MyRequestClass'

# Your Account Sid and Auth Token from twilio.com/console
account_sid = ENV['ACCOUNT_SID']
auth_token = ENV['AUTH_TOKEN']
proxy_address = ENV['PROXY_ADDRESS']
proxy_protocol = ENV['PROXY_PROTOCOL']
proxy_port = ENV['PROXY_PORT']

my_request_client = MyRequestClass.new(proxy_protocol, proxy_address, proxy_port)

@client = Twilio::REST::Client.new(account_sid, auth_token, 
                                    nil, nil, my_request_client)

message = @client.messages
  .create(
    to: '+593978613041',
    body: 'RB This is the ship that made the Kesssssel Run in fourteen parsecs?',
    from: '+13212855389',
   )

puts "Message SID: #{message.sid}"
