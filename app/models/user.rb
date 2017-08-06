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
  after_create :send_email_usuario

  def self.perform(order)
    service = User::UserService.new
    if sevice.import_order(order)
      send_email_creditos
      Wordpress.complete_order(order)
    end
  end

  def send_email_creditos
    # TODO: email avisando que creditos entraram
  end

  def send_email_usuario
    # TODO: avisar usuario que foi criado
  end

  def send_email_proposta
    # TODO: email avisando que proposta foi criada
  end

  def send_email_desejo
    # TODO: email avisando que proposta 24h
  end
end
