class CommentsController < ApplicationController

   def index
     @post = Post.find(params[:post_id])
     @comments = @post.comments
   end
   def new
     @comment = Comment.new
     @post = Post.find(params[:post_id])
   end
   def create
     @comment = current_user.comments.new(comment_params)
     @comment.post_id = params[:post_id]
     if @comment.save
       redirect_to user_post_path(current_user, @comment.post_id)
     else
       render :create
     end
   end
   def destroy
     @user = User.find(params[:user_id])
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
     @comment.destroy
     respond_to do |format|
       format.html { redirect_to user_post_path(@user, @post), notice: 'Comment was successfully destroyed.' }
       format.json { head :no_content }
     end
   end
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
