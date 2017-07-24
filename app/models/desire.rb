class Desire < ApplicationRecord
  #enum action: [:Promoção, :ProdutoServiço, :Slide_para_Sistema_Luqy]
  enum action: %w(Promoção Promoção/Serviço Slide_para_Sistema_Luqy)
  enum status: %w[Em_Analise Aprovado_pelo_Cliente]
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  belongs_to :company
end
