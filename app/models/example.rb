
class Example < ApplicationRecord
  URL_FORMAT = /\A(https:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i
  empty_text = I18n.t(:empty_text)
  empty_url = I18n.t(:empty_url)
  wrong_url_format = I18n.t(:wrong_url_format)

  validates :kata, presence: true, allow_blank: false
  validates :text, presence: { message: empty_text}, allow_blank: false
  validates :url, presence: { message: empty_url}, allow_blank: false
  validates_format_of :url, with: URL_FORMAT, message: wrong_url_format

  def self.for(kata)
    where(kata: kata)
  end

  def self.belongs(user_id)
    where(user: user_id)
  end
end
