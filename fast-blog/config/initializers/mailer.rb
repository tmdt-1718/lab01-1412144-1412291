ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "gmail.com",
    :user_name            => "notificationsec2017@gmail.com",
    :password             => 'ec20172018',
    :authentication       => "plain",
    :enable_starttls_auto => true
}