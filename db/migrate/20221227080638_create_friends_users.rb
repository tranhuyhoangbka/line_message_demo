class CreateFriendsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :friends_users do |t|
      t.references :friend, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :none
      t.string :link_token
      t.bigint :link_token_expire_at

      t.timestamps
    end
    add_index :friends_users, :none, unique: true
  end
end
