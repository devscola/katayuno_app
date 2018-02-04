class Kata < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
end
