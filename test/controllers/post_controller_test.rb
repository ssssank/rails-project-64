# frozen_string_literal: true

require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @post = posts(:one)

    @attrs = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraphs.join,
      category_id: categories(:one).id
    }
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    sign_in users(:one)
    get new_post_path
    assert_response :success
  end

  test 'should create post' do
    sign_in users(:one)
    post posts_path, params: { post: @attrs }

    post = Post.find_by @attrs

    assert { post }
    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get post_url(@post, locale: :en)
    assert_response :success
  end
end
