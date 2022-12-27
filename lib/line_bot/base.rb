require 'line/bot'

module LineBot
  class Base
    include HTTParty

    attr_accessor :account_link_token, :link_account_nonce

    base_uri 'https://api.line.me/v2'

    LINE_ACCOUNT_LINK_URL_PARTERM = "https://access.line.me/dialog/bot/accountLink?linkToken=%s&nonce=%s"

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

    # def send_template_message(line_user_id, messages)
    #   client.push_message(line_user_id, messages)
    # end

    def send_link_account_message(line_user_id)
      messages = [{
        "type": "template",
        "altText": "Account Link",
        "template": {
            "type": "buttons",
            "text": "You want to link account, if you want, please feel free to click below button",
            "actions": [{
                "type": "uri",
                "label": "Account Link",
                "uri": "https://2150-103-23-147-162.ap.ngrok.io/link_account/?linkToken=#{account_link_token}"
            }]
          }
        }]
      res = client.push_message(line_user_id, messages)
    rescue Exception => e
      puts e.backtrace
    end

    def line_account_link_url(from_request_account_link_token)
      LINE_ACCOUNT_LINK_URL_PARTERM % [from_request_account_link_token, get_link_account_nonce]
    end

    def get_account_link_token(line_user_id)
      @account_link_token ||= begin
        response = client.create_link_token(line_user_id)
        JSON.parse(response.body)['linkToken']
      end
    rescue Exception => e
      puts e.backtrace
    end

    private

    attr_accessor :client

    def get_link_account_nonce
      @link_account_nonce ||= SecureRandom.base64(16)
    end

  end
end