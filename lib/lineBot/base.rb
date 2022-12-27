require 'line/bot'

module LineBot
  class Base
    include HTTParty
    base_uri 'https://api.line.me/v2'

    def initialize
      @client ||= Line::Bot::Client.new { |config|
        config.channel_id = ENV["LINE_CHANNEL_ID"]
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      }
      channel_access_token = JSON.parse(@client.issue_channel_token.body)['access_token']
      @client.channel_token = channel_access_token
    rescue Exception => e
      puts e.backtrace
    end

    def send_text_message(line_user_id, content)
      client.push_message(line_user_id, [{type: 'text', text: content}])
    end

    def get_link_token(line_user_id)
      response = client.create_link_token(line_user_id)
      JSON.parse(response.body)['linkToken']
    rescue Exception => e
      puts e.backtrace
    end

    private

    attr_accessor :client

  end
end