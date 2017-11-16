class Belt < ApplicationRecord
  validates :kata, presence: true, allow_blank: false
end
