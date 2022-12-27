# == Schema Information
#
# Table name: friends_users
#
#  id                   :integer          not null, primary key
#  friend_id            :integer          not null
#  user_id              :integer          not null
#  none                 :string
#  link_token           :string
#  link_token_expire_at :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  link_status          :string
#
require 'test_helper'

class FriendsUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
