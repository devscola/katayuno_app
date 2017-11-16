require 'rails_helper'
require 'capybara'

describe 'Belts' do
  it 'can be added to a Kata' do
    belt_name = 'First Belt'
    belt_description = 'Belt description'
    kata = Kata.new(
      title: 'Kata title',
      description: 'Kata description'
    )
    kata.save

    visit kata_path(kata.id)
    fill_in(:name, with: belt_name)
    fill_in(:description, with: belt_description)
    click_on('Add Belt')

    expect(page).to have_content(belt_name)
    expect(page).to have_content(belt_description)
  end

  it 'can be deleted' do
    belt_name = 'Belt for delete'
    belt_description = 'Belt description'
    kata_title = 'Kata title'
    kata = Kata.new(
      title: kata_title,
      description: 'Kata description'
    )
    kata.save
    belt = Belt.new(
      name: belt_name,
      description: belt_description,
      kata: kata.id
    )
    belt.save

    visit kata_path(kata.id)
    click_on('Delete belt')

    expect(page).to have_content(kata_title)
    expect(page).not_to have_content(belt_name)
    expect(page).not_to have_content(belt_description)
  end
end
