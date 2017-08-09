class Proposal < ApplicationRecord
  enum status: %w(Em_Analise Aprovado)
  belongs_to :desire
  mount_uploader :img1, PhotoUploader
  mount_uploader :img2, PhotoUploader
  mount_uploader :img3, PhotoUploader

  after_create :send_email_proposta

  def send_email_proposta
    UserMailer.email_proposta(self.desire.user, self).deliver
  end
end
