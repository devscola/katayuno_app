class Kata < ApplicationRecord
  empty_title_message = I18n.t(:empty_title)
  emty_description_message = I18n.t(:empty_description)

  validates :title, presence: { message: empty_title_message }, allow_blank: false
  validates :description, presence: { message: emty_description_message }, allow_blank: false
end
