# frozen_string_literal: true

module Posts
  class LikesController < Posts::ApplicationController
    before_action :authenticate_user!, only: %i[create destroy]
    def create
      @like = resource_post.likes.build

      @like.user = current_user
      @like.save

      redirect_to resource_post
    end

    def destroy
      @like = PostLike.find_by(id: params[:id])
      @like&.destroy

      redirect_to resource_post
    end
  end
end
