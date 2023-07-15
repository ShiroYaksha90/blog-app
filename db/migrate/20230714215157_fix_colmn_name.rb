class FixColmnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :Name, :name
    rename_column :users, :Photo, :photo
    rename_column :users, :Bio, :bio
    rename_column :users, :PostsCounter, :posts_counter
    rename_column :posts, :AuthorId, :author_id
    rename_column :posts, :Title, :title
    rename_column :posts, :Text, :text
    rename_column :posts, :CommentsCounter, :comments_counter
    rename_column :posts, :LikesCounter, :likes_counter
    rename_column :comments, :AuthorId, :author_id
    rename_column :comments, :PostId, :post_id
    rename_column :comments, :Text, :text
    rename_column :likes, :AuthorId, :author_id
    rename_column :likes, :PostId, :post_id
  end
end
