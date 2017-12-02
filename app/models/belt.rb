class Belt < ApplicationRecord
  before_save :default_image

  validates :kata, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :image, format: {with: /\.(png|jpg)\Z/i}, allow_blank: true

  def default_image
    self.image ||= 'default_belt.jpg'
  end

  def self.for(kata)
    where(kata: kata)
  end
end
