class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form (email, name, message)
  attachments.inline['bk.png'] = File.read("#{Rails.root}/public/images/bk.png")
  @message = message
  @email = email
  @name = name
    mail(:from => email, 
        :to => 'b.kroggel@zeppelin-university.net', 
        :subject => "A new contact form message from #{name}")
  end

  def welcome_email
    attachments.inline['bk.png'] = File.read("#{Rails.root}/public/images/bk.png")
      mail(:from => 'b.kroggel@zeppelin-university.net',
          :to => :email,
          :subject  => "Hey, welcome at the center of creativity!")
  end
end