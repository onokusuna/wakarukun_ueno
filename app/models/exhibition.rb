class Exhibition < ApplicationRecord
  has_many :clips, dependent: :destroy
  has_many :congestions

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 100 }
  validates :place, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :image, presence: true
  validates :description, presence: true, length: { maximum: 2000 }
  validates :summary, presence: true, length: { maximum: 2000 }
  validates :status, presence: true

  def congested_by?(user)
    congestions.where(user_id: user.id).exists?
  end
end
