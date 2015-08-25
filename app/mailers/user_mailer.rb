class UserMailer < ActionMailer::Base

  def remind_reply(user, reply)
  	@user = user
  	@reply = reply
  	@from = '709542291@qq.com'
  	@subject = reply.content
  	mail( :to => '709542291@qq.com',
  		:from => @from,
  		:subject => @subject)
  end
end
