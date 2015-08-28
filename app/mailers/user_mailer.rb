class UserMailer < ActionMailer::Base

  def remind_reply(user, reply)
  	@user = user
  	@reply = reply
  	@from = '709542291@qq.com'
  	@subject = 'You got a latest reply'
  	mail( :to => 'murolq@163.com',
  		:from => @from,
  		:subject => @subject,
  		:template_path => 'mailers',
  		:template_name => 'remind_reply')
  end
end
