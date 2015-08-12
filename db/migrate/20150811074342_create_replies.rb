class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
    add_index :replies, [:post_id, :user_id, :created_at]
  end
end
