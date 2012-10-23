class SendNew < ActionMailer::Base
  def email(recipient)
    
     logger.info { "[LOGIN - ERROR] - El usuario #{@username} inicion sesion" }
    
    recipients recipient.email
    from "diegomao627@gmail.com"
    subject "This is a test mail"
    # recipient es enviado como una variable local a un “partial”
    # pero para acceder a ella se usa como variable de instancia
    body :user => recipient
    
  end
  
  def sendRegister (recipient)
    
    mail(:from => "diegomao627@gmail.com",:to => recipient, :subject => "Registered", :body => "hola mundo")
    
  end
  
end
