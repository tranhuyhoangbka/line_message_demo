class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    case params[:events][0][:type]
    when 'accountLink'
      friend = Friend.find_by_line_user_id(params[:events][0][:source][:userId])
      raise 'Friend not exist' unless friend
      friends_user = FriendsUser.find_by(friend: friend, none: params[:events][0][:link][:nonce])
      raise 'can not link account' unless friends_user
      friends_user.update(link_status: 'success')
    end
  end
end