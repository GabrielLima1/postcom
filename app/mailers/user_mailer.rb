class UserMailer < ActionMailer::Base

  def email_creditos(user, creditos)
    @user = user
    @creditos = creditos
    mail(:to => user.email,
      :subject => "[Postcom] Créditos adicionados")
  end

  def email_admin()
    mail(:to => ["contato@postcom.com.br", "rodox1209@gmail.com", "gabitobalima@gmail.com"],
      :subject => "[PostCom] Você Recebeu um Novo Pedido",
      :from => "PostCom<nao-responda@postcom.com.br>")
  end

  def email_admin_user()
    mail(:to => ["contato@postcom.com.br", "rodox1209@gmail.com", "gabitobalima@gmail.com"],
      :subject => "[PostCom] Foi Realizado um Cadastro de Usuário!",
      :from => "PostCom<nao-responda@postcom.com.br>")
  end

  def email_usuario(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
      :subject => "[Postcom] Usuário criado",
      :from => "PostCom<nao-responda@postcom.com.br>")
  end

  def email_proposta(user, proposta)
    @user = user
    @proposta = proposta
    mail(:to => user.email,
      :subject => "[Postcom] Proposta Recebida",
      :from => "PostCom<nao-responda@postcom.com.br>")
  end

  def email_desejo(user, desejo)
    @user = user
    @desejo = desejo
    mail(:to => user.email,
      :subject => "[Postcom] Desejo Recebido",
      :from => "PostCom<nao-responda@postcom.com.br>")
  end
end
