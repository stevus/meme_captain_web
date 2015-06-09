# encoding: UTF-8

# Generated (meme) image thumbnail model.
class GendThumb < ActiveRecord::Base
  include HasImageConcern

  before_validation :set_derived_image_fields
  validates :content_type, :height, :image, :size, :width, presence: true

  belongs_to :gend_image

  default_scope { without_image }
end
