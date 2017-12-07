class ExternalExample < ApplicationRecord
  URL_FORMAT = /\A(https:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i

  validates :kata, presence: true, allow_blank: false
  validates :text, presence: true, allow_blank: false
  validates :url, presence: true, allow_blank: false
  validates_format_of :url, with: URL_FORMAT

  def self.for(kata)
    where(kata: kata)
  end

  def self.belongs(user_id)
    where(user: user_id)
  end
end
