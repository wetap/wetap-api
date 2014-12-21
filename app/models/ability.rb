class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # everyone can read fountain data
    can :read, WaterFountain

    if user.persisted?
      can :create, WaterFountain
    end

    if user.admin?
      can :manage, :all
    end
  end
end
