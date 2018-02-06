class Belt < ApplicationRecord
  before_save :default_image

  validates :kata, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :image, format: {with: /\.(png|jpg)\Z/i}, allow_blank: true

  def self.ordered_for(kata)
    where(kata: kata).order(updated_at: :asc)
  end

  private

  def default_image
    if self.image.nil? || self.image.empty?
      self.image = 'default_belt.jpg'
    end
  end
end
