require 'rails_helper'
require 'capybara'

describe 'Katas' do
  it 'can be visited' do
    title = 'First Kata'
    description = 'Description for First Kata'
    kata = Kata.new(
      title: title,
      description: description
    )
    kata.save

    visit katas_path
    click_on(title)

    expect(page).to have_content(title)
    expect(page).to have_content(description)
  end
end
