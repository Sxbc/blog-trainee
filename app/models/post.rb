class Post < ActiveRecord::Base
  include AASM

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

  belongs_to :user
  validates :title, :body, presence: true
end
