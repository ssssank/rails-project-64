# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)

    @post_comment = post_comments(:one)
    @post = @post_comment.post
  end

  test 'should create post comment' do
    post post_comments_url(@post, locale: :en), params: { post_comment: { content: @post_comment.content } }

    assert_redirected_to post_path(@post)
  end
end
