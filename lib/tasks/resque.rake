# encoding: utf-8
require 'resque/tasks'

task "resque:setup" => :environment do
  ENV['QUEUE'] = '*'
end

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" => "resque:work"

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
