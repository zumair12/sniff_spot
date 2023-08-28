# frozen_string_literal: true

class Spot < ApplicationRecord
  has_many_attached :images

  has_many :reviews

  validates_presence_of :title, :price

  def images_urls
    images.map(&:url)
  end

  def to_json
    { id:, title:, price:, description:, created_at:, updated_at:, images_urls:, reviews: }
  end
end
