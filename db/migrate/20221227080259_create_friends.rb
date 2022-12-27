class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.string :line_user_id
      t.string :line_display_name
      t.string :line_avatar_url

      t.timestamps
    end
    add_index :friends, :line_user_id, unique: true
  end
end
