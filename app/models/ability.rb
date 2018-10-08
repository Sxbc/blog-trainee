class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "author"
      can :manage, Post
    else user.role == "reviewer"
      can :manage, Post
    end
  end
end
