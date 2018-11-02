class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :petition_id, null: false
      t.integer :comment_id, null: false
      t.text :body, null: false
      t.integer :likes
      t.string :user_display_name, null: false
      t.integer :user_id, null: false
      t.datetime :comment_created_at, null: false
      t.timestamps
    end
    add_index :comments,[:comment_id, :petition_id], unique: true
  end
end
