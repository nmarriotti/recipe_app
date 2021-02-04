class AddCommentsIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :comments, :recipe_id
  end
end
