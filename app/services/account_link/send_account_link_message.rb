module AccountLink
  class AcountLinkedException < StandardError
  end

  class SendAccountLinkMessage
    def perform(friend, user)
      raise AcountLinkedException.new('Account Linked already!') if FriendsUser.exists?(friend: friend, user: user)

      line_bot = LineBot::Base.new
      account_link_token = line_bot.get_account_link_token(friend.line_user_id)

      FriendsUser.create(user: user, friend: friend, link_token: account_link_token, link_status: 'pending')

      line_bot.send_link_account_message(friend.line_user_id)
    end
  end
end