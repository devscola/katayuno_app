require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'Examples' do
  it 'can be added to a Kata' do
    kata = create_kata
    example_text = 'Example text'

    visit kata_path(kata.id)
    click_on('Solution examples')
    fill_in('text', with: example_text)
    fill_in('url', with: 'https://example.url')
    click_on('Add Example')

    expect(page).to have_content(example_text)
  end

  context 'when admin is logged' do
    before(:each) do
      log_in_admin
    end

    it 'can be deleted' do
      example_text = 'Example text'
      example = create_example(example_text)

      visit examples_path(example.kata)
      click_on('Delete Example')

      expect(page).not_to have_content(example_text)
    end

    it 'can be edited' do
      example = create_example
      edited_text = 'Edited example'

      visit examples_path(example.kata)
      click_on('Edit Example')
      fill_in('example_text', with: edited_text)
      fill_in('example_url', with: 'https://edited-example.url')
      click_on('Edit Example')

      expect(page).to have_content(edited_text)
    end
  end

  it 'can be handled only by its owner' do
    user = log_in_user
    kata = create_kata
    example = Example.new(
      text: 'User example text',
      url: 'https://example.url',
      kata: kata.id,
      user: user.id
    )
    example.save
    example = Example.new(
      text: 'Another user example',
      url: 'https://example.url',
      kata: kata.id
    )
    example.save

    visit examples_path(kata.id)

    expect(page).to have_content('Edit Example', count: 1)
    expect(page).to have_content('Delete Example', count: 1)
  end

  def create_example(text='Example text', url='https://example.url', kata_id=nil)
    if kata_id.nil?
      kata = create_kata
      kata_id = kata.id
    end
    example = Example.new(
      text: text,
      url: url,
      kata: kata_id
    )
    example.save
    example
  end

  def create_another_user_example_with(text, kata_id)
    another_user = User.new(email: 'another_user@test.com', password: '12345678', password_confirmation: '12345678')
    another_user.save
    create_example_with_user(text, '', kata_id, another_user.id)
  end
end
