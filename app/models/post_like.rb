# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :post
end
