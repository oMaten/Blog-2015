Blog2015::Application.config.action_mailer.delivery_method = :smtp
Blog2015::Application.config.action_mailer.smtp_settings = {
  :address              => "smtp.qq.com",
  :port                 => 25,
  :domain               => "qq.com",
  :user_name            => "709542291@qq.com",
  :password             => "19820zxyCN",
  :authentication       => "login",
  :openssl_verify_mode  => "none",
}
