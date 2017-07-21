# /app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.kind == 'client'
        can :access, :rails_admin
        can :dashboard
        can :manage, Company, user_id: user.id
        can :manage, Desire, user_id: user.id
        # can :read, Proposal do |c|
        #   proposal.desire.id == c.desire.id
        # end
      elsif user.kind == 'manager'
        can :manage, :all
      end
    end
  end
end
