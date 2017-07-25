class Desire < ApplicationRecord
  #enum action: [:Promoção, :ProdutoServiço, :Slide_para_Sistema_Luqy]
  enum action: %w(Promoção Promoção/Serviço Slide_para_Sistema_Luqy)
  enum status: %w[Em_Analise Aprovado_pelo_Cliente]
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  belongs_to :company

  before_save :credit_user

  def credit_user
    #u = self.user_id
    if self.user.credit <= 0
      #false
      throw(:abort)
    else
      self.user.credit -=1
      self.user.save
    end
  end
end
