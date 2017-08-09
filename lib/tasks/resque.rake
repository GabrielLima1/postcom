# encoding: utf-8
require 'resque/tasks'

task 'resque:setup' => :environment

desc "Importa clientes e créditos do Wordpress."
task :import_data => :environment do
  begin
    p "Importando Pedidos"
    orders = Wordpress.get_orders

    p "Processando #{orders.count} pedidos"
    orders.each do |order|
      Resque.enqueue(User, order)
    end
  end
end
