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
    can :manage, User, id: user.id
  end

  def member_permissions(member)
    guest_permissions(member)
    can :manage, User, id: user.id
  end

  def guest_permissions(user)
    can %i[destroy read update add_item_to_order], Order
    can :read, Item
    can :read, Category
    can :destroy, ItemsOrder
  end

end
