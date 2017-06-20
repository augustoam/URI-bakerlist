class Token < ApplicationRecord
  belongs_to :usuario
  validates :usuario, presence: true
  validates :token, uniqueness: true
end
