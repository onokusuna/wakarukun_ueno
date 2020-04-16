class Exhibition < ApplicationRecord
  has_many :clips

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 200 }
  validates :place, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :summary, presence: true, length: { maximum: 1000 }
  validates :status, presence: true
end
