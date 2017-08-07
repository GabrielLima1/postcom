class UserMailer < ActionMailer::Base
  default :from => 'gabitobalima@gmail.com'

  def email_creditos(user, creditos)
    @user = user
    @creditos = creditos
    mail(:to => user.email,
      :subject => "[Postcom] Créditos adicionados")
  end

  def email_usuario(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
      :subject => "[Postcom] Usuário criado")
  end

  def email_proposta(user, proposta)
    @user = user
    @proposta = proposta
    mail(:to => user.email,
      :subject => "[Postcom] Proposta Recebida")
  end

  def email_desejo(user, desejo)
    @user = user
    @desejo = desejo
    mail(:to => user.email,
      :subject => "[Postcom] Desejo Recebido")
  end
end
