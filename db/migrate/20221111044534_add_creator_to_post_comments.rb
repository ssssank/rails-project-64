class AddCreatorToPostComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :post_comments, :creator, null: false, foreign_key: { to_table: :users }
  end
end
