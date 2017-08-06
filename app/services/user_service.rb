# encoding: utf-8

class User::UserService

  def planos
    {
      14849=>{"plano"=>"diamond", "creditos"=>30},
      14847=>{"plano"=>"gold", "creditos"=>25},
      14845=>{"plano"=>"silver", "creditos"=>15},
      14835=>{"plano"=>"bronze", "creditos"=>5}
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
      User.create(email: user_data["email"], password: password)
    end
    user
  end

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end

  def import_data(user, order_items)
    begin
      order_items.each do |order_item|
        product_id = order_item["product_id"]
        if planos[product_id]
          plano = planos[product_id]["plano"]
          creditos = planos[product_id]["creditos"]
          user.credit = user.credit + creditos
          user.plan = plano
          user.save
        else
          false
        end
      end
    rescue
      false
    end
  end
end
