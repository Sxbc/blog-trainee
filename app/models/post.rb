class Post < ActiveRecord::Base
  belongs_to :user
  has_many   :images, dependent: :destroy
  validates  :title, :body, presence: true
  validates_associated  :images
  accepts_nested_attributes_for :images
end
