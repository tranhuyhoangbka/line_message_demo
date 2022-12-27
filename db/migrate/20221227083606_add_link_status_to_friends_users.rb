class AddLinkStatusToFriendsUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :friends_users, :link_status, :string
  end
end
