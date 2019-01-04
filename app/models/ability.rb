class Ability

  include CanCan::Ability

  def initialize(user)
    if user.andand.admin?
      admin_permissions(user)
    elsif user.andand.member?
      member_permissions(user)
    else
      guest_permissions(user)
    end
  end

  private

  def admin_permissions(user)
    can :manage, :all
  end

  def member_permissions(member)
    guest_permissions(member)
  end

  def guest_permissions(user)
    can :read, Item
    can :read, Category
  end

end
