class Belt < ApplicationRecord
  validates :kata, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false

  def self.for(kata)
    where(kata: kata)
  end
end
