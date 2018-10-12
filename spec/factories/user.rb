FactoryBot.define do
  factory :author, class: User do
    email     { 'author@email.com' }
    password  { 'password' }
    role      { 'author' }
  end

  factory :admin, class: User do
    email     { 'admin@email.com' }
    password  { 'password' }
    role      { 'admin' }
  end

  factory :reviewer, class: User do
    email     { 'reviewer@email.com' }
    password  { 'password' }
    role      { 'reviewer' }
  end
end
