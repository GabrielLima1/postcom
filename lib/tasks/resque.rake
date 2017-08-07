# encoding: utf-8
require 'resque/tasks'

task 'resque:setup' => :environment

desc "Importa clientes e créditos do Wordpress."
task :import_data => :environment do
  begin
    orders = Wordpress.get_orders
    # order = orders.first
    # User.perform(order)

    orders.each do |order|
      Resque.enqueue(User, order)
    end
  end
end
