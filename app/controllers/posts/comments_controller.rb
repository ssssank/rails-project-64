# frozen_string_literal: true

module Posts
  class CommentsController < Posts::ApplicationController
    before_action :authenticate_user!, only: %i[create]
    def create
      @post = resource_post
      @comment = resource_post.comments.build(comment_params)
      @comment.post = @post
      @comment.user = current_user

      if @comment.save
        redirect_to resource_post, notice: 'Comment was successfully created.'
      else
        flash[:alert] = 'Comment has not been added'
        render 'posts/show'
      end
    end

    private

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:post_comment).permit(:content, :user_id, :parent_id)
    end
  end
end
