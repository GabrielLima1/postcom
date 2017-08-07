class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  enum kind: [:client, :manager]
  enum status: [:active, :inactive]
  enum plan: [:bronze, :silver, :gold, :diamond]
  has_many :companies
  has_many :desires
  #after_create :send_email_usuario

  def self.perform(order)
    service = UserService.new
    if service.import_order(order)
      # send_email_creditos
      Wordpress.complete_order(order)
    end
  end
end
