require 'securerandom'

class ExternalKata < ApplicationRecord
  URL_FORMAT = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i

  validates :name, presence: true, allow_blank: false
  validates :url, presence: true, allow_blank: false
  validates_format_of :url, with: URL_FORMAT

  def self.by(external_id)
    self.where(external_id: external_id)
  end
end
