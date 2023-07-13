class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :AuthorId
      t.integer :PostId
      t.timestamps
    end
    add_foreign_key :likes, :users, column: :AuthorId
    add_foreign_key :likes, :posts, column: :PostId
    add_index :likes, :AuthorId
    add_index :likes, :PostId
  end
end
