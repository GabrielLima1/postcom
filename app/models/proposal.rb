class Proposal < ApplicationRecord
  enum status: %w[Em_Analise Aprovado_pelo_Cliente]
  belongs_to :desire
end
