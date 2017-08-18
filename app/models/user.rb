class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  #validates :name, presence: true
  after_create :email_admin_user

  enum kind: [:client, :manager]
  enum status: [:active, :inactive]
  enum plan: [:bronze, :silver, :gold, :diamond]
  has_many :companies
  has_many :desires
  @queue = :import_data

  def email_admin_user
    UserMailer.email_admin_user.deliver
  end

  def self.perform(order)
    p "Importando pedido"
    service = UserService.new
    if service.import_order(order)
      Wordpress.complete_order(order)
    end
  end
end
