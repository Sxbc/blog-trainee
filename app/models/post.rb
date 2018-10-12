class Post < ActiveRecord::Base
  extend  FriendlyId
  include AASM

  belongs_to :user
  has_many   :images, dependent: :destroy
  validates  :title,:body, presence: true
  validates  :slug,  uniqueness: true, presence: true
  validates_associated          :images
  accepts_nested_attributes_for :images
  friendly_id :slug_candidates, use: :slugged

  after_create :remake_slug

  def slug_candidates
    [[:id, :title]]
  end

  def remake_slug
    self.update_attribute(:slug, nil)
    self.save!
  end

  aasm whiny_transitions: false do
    state :in_draft, initial: true
    state :reviewing
    state :published
    state :cancel

    event :review do
      transitions from: :in_draft, to: :reviewing
    end

    event :publish do
      transitions from: :reviewing, to: :published
    end

    event :cancel do
      transitions from: [:reviewing, :published], to: :in_draft
    end
  end
end
