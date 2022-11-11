# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)

    @user = users(:one)
    @post_one = posts(:one)
    @post_two = posts(:two)
    @like = post_likes(:one)
  end

  test 'should create like post' do
    assert_difference('PostLike.count', 1) do
      post post_likes_url(@post_two, locale: :en)
    end

    assert_redirected_to post_url(@post_two, locale: :en)

    like = PostLike.find_by!(user_id: @user.id, post_id: @post_two.id)

    assert { like }
  end
end
