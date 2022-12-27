# == Schema Information
#
# Table name: friends
#
#  id                :integer          not null, primary key
#  line_user_id      :string
#  line_display_name :string
#  line_avatar_url   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'test_helper'

class FriendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
