class Proposal < ApplicationRecord
  enum status: %w(Em_Analise Aprovado)
  belongs_to :desire
  mount_uploader :img1, Img1Uploader
  mount_uploader :img2, Img2Uploader
  mount_uploader :img3, Img3Uploader

  after_create :send_email_proposta

  def send_email_proposta
    UserMailer.email_proposta(self.desire.user, self)    
  end
end
