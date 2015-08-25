module UserMailersHelper

  def got_replies(user, reply)
    @user = user
    @reply = reply
    mail(to: @user.email,
         subject: @reply.content,)
  end
end