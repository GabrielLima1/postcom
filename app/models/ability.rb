# /app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can [:read, :edit], User.where(id: user.id)
      if user.kind == 'client'
        can :access, :rails_admin
        can :dashboard
        can [:create, :read, :edit], Company, user_id: user.id
        can [:create, :read], Desire, user_id: user.id
        can :read, Proposal, id: (Proposal.all.select {|p| p.desire.user_id == user.id}).map {|prop| prop.id}
      elsif user.kind == 'manager'
        can :manage, :all
      end
    end
  end
end
