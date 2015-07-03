class CommentMailer < ApplicationMailer

    def notify_pod_owner(comment)
      @user = comment.user
      @pod = comment.pod
      mail(to: @pod.user.email, subject: "#{@user.full_name} commented on your post")
    end
end
