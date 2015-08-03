class UserMailerPreview < ActionMailer::Preview
  def thank_you
    message = "Minions ipsum uuuhhh tulaliloo daa me want bananaaa! Underweaaar hana dul sae me want bananaaa! Belloo! Wiiiii baboiii hana dul sae wiiiii wiiiii poopayee baboiii wiiiii. Poulet tikka masala uuuhhh wiiiii wiiiii pepete butt poulet tikka masala uuuhhh. Daa chasy gelatooo butt poopayee bee do bee do bee do butt tulaliloo chasy me want bananaaa! Bappleees bananaaaa tank yuuu! Hana dul sae daa chasy potatoooo underweaaar hana dul sae. Hana dul sae baboiii butt underweaaar baboiii poopayee. Potatoooo potatoooo uuuhhh potatoooo bananaaaa wiiiii tulaliloo belloo!"
    email = "test@mail.com"
    name = "Max Mustermann" 
    UserMailer.contact_form(email, name, message)
  end

  def welcome_email
    UserMailer.welcome_email(self)
  end
end
