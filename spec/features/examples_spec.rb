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

  it 'shows errors when it doesnt have a text, url or wrong url' do
    kata = create_kata

    visit kata_path(kata.id)
    click_on('Solution examples')
    fill_in('text', with: '')
    fill_in('url', with: '')
    click_on('Add Example')

    expect(page).to have_content(empty_text_message)
    expect(page).to have_content(empty_url_message)
    expect(page).to have_content(wrong_url_format_message)
  end

  context 'when admin is logged' do
    before(:each) do
      log_in_admin
    end

    it 'can be deleted' do
      example_text = 'Example text'
      example = create_example(example_text)

      visit examples_path(example.kata)
      click_on('delete')

      expect(page).not_to have_content(example_text)
    end

    it 'can be edited' do
      example = create_example
      edited_text = 'Edited example'

      visit examples_path(example.kata)
      click_on('mode_edit')
      fill_in('example_text', with: edited_text)
      fill_in('example_url', with: 'https://edited-example.url')
      click_on('Edit Example')

      expect(page).to have_content(edited_text)
    end

    it 'shows errors when it doesnt have a text, url or wrong url' do
      example = create_example

      visit examples_path(example.kata)
      click_on('mode_edit')
      fill_in(:example_text, with: '')
      fill_in(:example_url, with: '')
      click_on('Edit Example')

      expect(page).to have_content(empty_text_message)
      expect(page).to have_content(empty_url_message)
      expect(page).to have_content(wrong_url_format_message)
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

    expect(page).to have_content('mode_edit', count: 1)
    expect(page).to have_content('delete', count: 1)
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

  def empty_text_message
    I18n.t(:empty_text)
  end

  def empty_url_message
    I18n.t(:empty_url)
  end

  def wrong_url_format_message
    I18n.t(:wrong_url_format)
  end
end
