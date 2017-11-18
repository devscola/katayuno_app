
class Example < ApplicationRecord
  validates :kata, presence: true, allow_blank: false
  validates :text, presence: true, allow_blank: false
  validates :url, presence: true, allow_blank: false

  def self.for(kata)
    where(kata: kata)
  end
end
