class Ability
  include CanCan::Ability

    def initialize(user)

       user ||= User.new

       can :manage, Pod do |pod|
         pod.user == user
       end

       can :destroy, Comment do |comment|
         comment.pod.user == user || comment.user == user
       end


    end
end
