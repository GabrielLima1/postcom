class UserMailer < ActionMailer::Base

  default :from => 'gabitobalima@gmail.com'

  def send_email_creditos(user)
    @user = user
    mail(:to => user.email,
      :subject => "Postcom - Créditos adicionados")
  end

  def send_email_usuario(user)
    @user = user
    mail(:to => user.email,
      :subject => "[Postcom] Usuário criado")
  end

  def send_email_proposta(user)
    @user = user
    mail(:to => user.email,
      :subject => "[Postcom] Proposta Recebida")
  end

  def send_email_desejo(user)
    @user = user
    mail(:to => user.email,
      :subject => "[Postcom] Desejo Recebido")
  end
end
