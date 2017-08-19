# encoding: utf-8

class UserService

  def planos
    {
      14849=>{"plano"=>"diamond", "creditos"=>30},
      14847=>{"plano"=>"gold", "creditos"=>25},
      14845=>{"plano"=>"silver", "creditos"=>15},
      14835=>{"plano"=>"bronze", "creditos"=>5},
      15001=>{"plano"=>"bronze", "creditos"=>1}
    }
  end

  def import_order(order)
    user_data = order["billing_address"]
    order_items = order["line_items"]

    user = import_user(user_data)
    import_data(user, order_items)
  end

  def import_user(user_data)
    user = User.find_by_email(user_data["email"])
    unless user
      password = generate_code(7)
      nome = user_data["first_name"]
      nome = nome +" "+ user_data["last_name"] unless user_data["last_name"].blank?
      user = User.create(email: user_data["email"], password: password, name: nome)
      # UserMailer.email_usuario(user, password).deliver
    end
    user
  end

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end

  def import_data(user, order_items)
    creditos = 0
    order_items.each do |order_item|
      product_id = order_item["product_id"]
      if planos[product_id]
        plano = planos[product_id]["plano"]
        creditos += planos[product_id]["creditos"]
        user.plan = plano
      else
        false
      end
    end
    user.credit = user.credit + creditos
    if user.save
      # UserMailer.email_creditos(user, creditos).deliver
    else
      false
    end
  end
end
