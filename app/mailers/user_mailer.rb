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

  def welcome_email(user)
    attachments.inline['ideamanufactorylogo.png'] = File.read("#{Rails.root}/public/images/ideamanufactorylogo.png")
    @user = user
      mail(:from => 'b.kroggel@zeppelin-university.net',
          :to => user.email,
          :subject  => "Hey #{user.first_name}, welcome at the center of creativity!")
  end

  def order_confirmation_user(user, product)
    attachments.inline['ideamanufactorylogo.png'] = File.read("#{Rails.root}/public/images/ideamanufactorylogo.png")
    @user = user
    @product = product
      mail(:from => 'b.kroggel@zeppelin-university.net',
            :to => user.email,
            :subject => "OrderConfirmation for #{product.name}")
  end
end