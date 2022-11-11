# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    @comment = PostComment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.creator = current_user

    if @post.save
      redirect_to @post, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :creator_id, :category_id)
  end
end
