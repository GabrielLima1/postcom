require 'woocommerce_api'

class Wordpress
  def self.woocommerce
    woocommerce = WooCommerce::API.new(
    ENV["URL_WORDPRESS"], #Url do site
    ENV["CONSUMER_KEY"], #Consumer Key
    ENV["CONSUMER_SECRET"], #Consumer Secret
    {
      version: "v2" #Versão da API
    }
    )
    woocommerce
  end

  def self.get_products
    products = woocommerce.get("products?filter[limit]=1000&fields=id,permalink,title,attributes").parsed_response
    products['products']
  end

  def self.email_note order, message
    data = {
      order_note: {
        note: message,
        customer_note: true
      }
    }
    woocommerce.post("orders/#{order["id"]}/notes", data).parsed_response
  end

  def self.complete_order order
    data = {
      order: {
        status: "completed"
      }
    }
    #PUT para mudar a ordem para concluída
    woocommerce.put("orders/#{order["id"]}", data).parsed_response
  end

  def self.get_orders
    #Pegar todos os pedidos com status Processado, 200, ordem ascendente e apenas dados
    #que serão usados: id,shipping_address,line_items, billing_address
    all_orders = woocommerce.get("orders?filter[limit]=40&filter[order]=asc&status=processing&fields=id,completed_at,shipping_address,billing_address,line_items").parsed_response
    #Converção para array
    all_orders["orders"]
  rescue
    @error = "Erro ao importar pedidos do Wordpress, favor verificar configurações."
  end

  def self.get_notes order
    all_notes = woocommerce.get("orders/#{order["id"]}/notes").parsed_response
    all_notes["order_notes"]
  end
end
