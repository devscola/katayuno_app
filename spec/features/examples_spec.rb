require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'Examples' do
  it 'can be added to a Kata' do
    kata = create_kata
    example_text = 'Example text'

    visit kata_path(kata.id)
    click_on('Examples')
    fill_in('text', with: example_text)
    fill_in('url', with: 'http://example.url')
    click_on('Add Example')

    expect(page).to have_content(example_text)
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
    fill_in('example_url', with: 'http://edited-example.url')
    click_on('Edit Example')

    expect(page).to have_content(edited_text)
  end

  it 'can be handled only by its owner' do
    another_user_example_text = 'Another User example text'
    create_another_user_example_with(another_user_example_text)
    user_example_text = 'User example text'
    user = log_in_user
    kata = create_kata
    example = Example.new(
      text: user_example_text,
      url: 'http://example.url',
      kata: kata.id,
      user: user.id
    )
    example.save

    visit root_path
    click_on('My Examples')

    expect(page).not_to have_content(another_user_example_text)
    expect(page).to have_content(user_example_text)
  end

  def create_example(text='Example text', url='http://example.url', kata_id=nil)
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

  def create_example_with_user(text='Example text', url='http://example.url', kata_id=nil, user_id=nil)
    if kata_id.nil?
      kata = create_kata
      kata_id = kata.id
    end
    if user_id.nil?
      user = create_user
      user_id = user.id
    end
    example = Example.new(
      text: text,
      url: url,
      kata: kata_id
    )
    example.save
    example
  end

  def create_another_user_example_with(text)
    another_user = User.new(email: 'another_user@test.com', password: '12345678', password_confirmation: '12345678')
    another_user.save
    create_example_with_user(text, '', nil, another_user.id)
  end
end
