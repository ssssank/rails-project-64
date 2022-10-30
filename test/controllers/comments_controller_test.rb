# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_comment = post_comments(:one)
    @post = @post_comment.post
  end

  test 'should create post comment' do
    post post_comments_url(@post), params: { post_comment: { content: @post_comment.content } }

    assert_redirected_to post_path(@post)
  end
end
