class Coin < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true
  mount_uploader :logo, LogoUploader
end
