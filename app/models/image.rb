class Image < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :post
  mount_uploader :image, ImageUploader
end
