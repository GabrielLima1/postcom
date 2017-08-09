# /app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      # can [:read, :edit], User.where(id: user.id)
      if user.kind == 'client'
        can [:read, :edit], User.where(id: user.id)
        can :access, :rails_admin
        can :dashboard
        # cannot [:destroy], Company
        can [:create, :read, :edit], Company, user_id: user.id
        can [:manage], Desire, user_id: user.id
        cannot [:destroy, :edit], Desire
        #can [:approving,:read, :grid], Proposal, id: (Proposal.all.select {|p| p.desire.user_id == user.id}).map {|prop| prop.id}
        can [:read, :edit, :approving], Proposal, id: (Proposal.all.select {|p| p.desire.user_id == user.id}).map {|prop| prop.id}
        cannot [:destroy, :create], Proposal, id: (Proposal.all.select {|p| p.desire.user_id == user.id}).map {|prop| prop.id}

      elsif user.kind == 'manager'
        #cannot [:approving], Proposal
        can :manage, :all
      end
    end
  end
end
