class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, Backlog, user_id: user.id
    can :read,   Backlog do |backlog|
      backlog.shared_users.include? user
    end

  end
end
