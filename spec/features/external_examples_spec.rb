require_relative 'helpers'
require 'rails_helper'
require 'capybara'

describe 'External examples' do
  before do
    @kata = create_external_kata
  end

  context 'by non logged user' do
    before do
      create_external_example(kata: @kata.id)
    end

    it 'cannot be deleted' do

      visit root_path
      click_on('Solution examples')

      expect(page).not_to have_link('Delete')
    end

    it 'cannot be edited' do

      visit root_path
      click_on('Solution examples')

      expect(page).not_to have_link('Edit')
    end
  end

  context 'by normal user' do
    before(:each) do
      @user = log_in_user
    end

    it 'can be edited his examples' do
      another_user_id = 1234567890
      create_external_example(user: another_user_id, kata: @kata.id)
      create_external_example(user: @user.id, kata: @kata.id)

      visit root_path
      click_on('Solution examples')

      expect(page).to have_link('Edit', count: 1)
    end

    it 'can be deleted his examples' do
      another_user_id = 1234567890
      create_external_example(user: another_user_id, kata: @kata.id)
      create_external_example(user: @user.id, kata: @kata.id)

      visit root_path
      click_on('Solution examples')

      expect(page).to have_link('Delete', count: 1)
    end
  end

  context 'by admin' do
    before(:each) do
      @admin = log_in_admin
    end

    it 'can be created' do
      example_text = 'External example text'
      example_link = 'https://external-example.com'

      visit root_path
      click_on('Solution examples')
      fill_in('text', with: example_text)
      fill_in('url', with: example_link)
      click_on('Save')

      expect(page).to have_link(example_text, href: example_link)
    end

    it 'can be deleted' do
      example_text = 'External example text'
      example_link = 'https://external-example.com'
      create_external_example(
        text: example_text,
        url: example_link,
        user: @admin.id,
        kata: @kata.id
      )

      visit root_path
      click_on('Solution examples')
      click_on('Delete')

      expect(page).not_to have_link(example_text, href: example_link)
    end

    it 'can be edited' do
      edited_example_text = 'Edited example'
      edited_example_link = 'https://edited-example.com'
      create_external_example(user: @admin.id, kata: @kata.id)

      visit root_path
      click_on('Solution examples')
      click_on('Edit')
      fill_in('external_example_text', with: edited_example_text)
      fill_in('external_example_url', with: edited_example_link)
      click_on('Save')

      expect(page).to have_link(edited_example_text, href: edited_example_link)
    end
  end

  def create_external_example(text:'External example text', url:'https://external-example.com', user:1, kata:1)
    example = ExternalExample.new(
      text: text,
      url: url,
      kata: kata,
      user: user
    )
    example.save
    example
  end
end
