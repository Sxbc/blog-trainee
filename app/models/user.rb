class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  attr_accessor :roles

  has_many :posts

  ROLES = %w[admin author reviewer]

  serialize :roles

  def roles_symbols
    [role.to_sym].map
  end
end
