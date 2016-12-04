class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user

    alias_action :update, :destroy, to: :modify
    alias_action :show, :index, to: :see
    user ? user_abilities(user) : guest_abilities

  end

  def guest_abilities
    can :read, :home
  end

  def user_abilities(user)
    guest_abilities

    can :create, [Patient]
    can :modify, [Patient], user_id: user.id
    can :see, [Patient], user_id: user.id

    # can :destroy, [Attachment], attachable: { user_id: user.id }

    # can :set_default, Patient, user_id: user.id
  end
end
