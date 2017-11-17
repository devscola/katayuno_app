require 'rails_helper'
require 'capybara'

describe 'Belts' do
  it 'can be added to a Kata' do
    belt_name = 'First Belt'
    belt_description = 'Belt description'
    kata = create_kata

    visit kata_path(kata.id)
    fill_in(:name, with: belt_name)
    fill_in(:description, with: belt_description)
    click_on('Add Belt')

    expect(page).to have_content(belt_name)
    expect(page).to have_content(belt_description)
  end

  it 'are showed only for the Kata that owns' do
    first_kata = create_kata
    second_kata = create_kata
    belt = Belt.new(
      name: 'First Belt',
      description: 'Belt description',
      kata: first_kata.id
    )
    belt.save

    visit kata_path(second_kata.id)

    expect(page).not_to have_content(belt.name)
    expect(page).not_to have_content(belt.description)
  end

  it 'can be edited' do
    new_belt_name = 'New belt name'
    new_belt_description = 'New belt description'
    kata = create_kata
    belt = Belt.new(
      name: 'Belt for be edited',
      description: 'Belt for be edited',
      kata: kata.id
    )
    belt.save

    visit kata_path(kata.id)
    click_on('Edit Belt')
    fill_in(:name, with: new_belt_name)
    fill_in(:description, with: new_belt_description)
    click_on('Save')

    expect(page).to have_content(new_belt_name)
    expect(page).to have_content(new_belt_description)
  end

  it 'can be deleted' do
    kata = create_kata
    belt = Belt.new(
      name: 'Belt for delete',
      description: 'Belt description',
      kata: kata.id
    )
    belt.save

    visit kata_path(kata.id)
    click_on('Delete belt')

    expect(page).to have_content(kata.title)
    expect(page).not_to have_content(belt.name)
    expect(page).not_to have_content(belt.description)
  end

  def create_kata(title='Kata title' ,description='Kata description')
    kata = Kata.new(
      title: title,
      description: description
    )
    kata.save
    kata
  end
end
