class LinkAccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    raise 'link Token can not blank' unless params[:linkToken].present?
    line_bot = ::LineBot::Base.new
    line_account_link_url = line_bot.line_account_link_url(params[:linkToken])
    friends_user = FriendsUser.find_by(user: current_user, link_token: params[:linkToken])
    raise 'can not link account for curernt_user, please use anothr account' unless friends_user
    friends_user.update!(none: line_bot.link_account_nonce)
    redirect_to line_account_link_url
  end
end