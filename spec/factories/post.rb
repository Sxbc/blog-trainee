FactoryBot.define do
  factory :draft, class: Post do
    title { 'Title' }
    body  { 'Body' }
    slug  { 'Title' }
    aasm_state  { 'in_draft' }
  end
end
