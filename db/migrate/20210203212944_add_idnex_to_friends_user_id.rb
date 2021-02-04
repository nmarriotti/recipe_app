class AddIdnexToFriendsUserId < ActiveRecord::Migration[6.1]
  def change
    add_index :friends, :user_id
  end
end
