class RenameCreatorToUserInPostLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :post_likes, :creator_id, :user_id
  end
end
