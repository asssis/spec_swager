class Artigo < ApplicationRecord
  validates :autor, presence: true
end
