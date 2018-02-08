class Belt < ApplicationRecord
  URL_FORMAT = /(\.png|\.jpg)\z/i

  empty_name = I18n.t(:empty_name)
  empty_description = I18n.t(:empty_description)
  wrong_url_image_format = I18n.t(:wrong_url_image_format)

  before_save :default_image

  validates :kata, presence: true, allow_blank: false
  validates :name, presence: { message: empty_name }, allow_blank: false
  validates :description, presence: { message: empty_description }, allow_blank: false
  validates :image, format: { with: URL_FORMAT, message: wrong_url_image_format }, allow_blank: true

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
