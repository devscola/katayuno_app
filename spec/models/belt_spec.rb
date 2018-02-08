require 'rails_helper'

describe 'Belt' do
  it 'belongs to a Kata' do
    belt = Belt.new(
      name: 'Belt name',
      description: 'Belt description',
      kata: nil
    )

    belt.save

    expect(belt.errors.size).to eq(1)
    expect(belt.errors[:kata]).to eq(["can't be blank"])
  end

  it 'has to have a name and description' do
    any_kata = 1
    belt = Belt.new(
      name: nil,
      description: nil,
      kata: any_kata
    )

    belt.save

    expect(belt.errors.size).to eq(2)
    expect(belt.errors[:name]).to eq([empty_name_messsage_error])
    expect(belt.errors[:description]).to eq([empty_description_message_error])
  end

  it 'needs an URL if has image' do
    any_name = 'Belt'
    any_description = 'Description'
    any_kata = 1
    belt = Belt.new(
      name: any_name,
      description: any_description,
      kata: any_kata,
      image: 'invalid_url'
    )

    belt.save

    expect(belt.errors.size).to eq(1)
    expect(belt.errors[:image]).to eq([wrong_url_image_format_message_error])
  end

  it 'has a default image' do
    default_image = 'default_belt.jpg'

    any_name = 'Belt'
    any_description = 'Description'
    any_kata = 1
    belt = Belt.new(
      name: any_name,
      description: any_description,
      kata: any_kata,
      image: nil
    )

    belt.save

    expect(belt.image).to eq(default_image)
  end

  it 'retrieves katas ordered by update at' do
    kata_id = 1
    last_updated = Belt.new(name: 'Any name', description: 'Any description', kata: kata_id)
    last_updated.save
    first_updated = Belt.new(name: 'Any name', description: 'Any description', kata: kata_id)
    first_updated.save
    first_updated.update_attributes(updated_at: 10.minutes.ago)
    last_updated.update_attributes(updated_at: 1.minutes.ago)

    belts = Belt.ordered_for(kata_id)

    expect(belts).to eq([first_updated, last_updated])
  end

  def empty_name_messsage_error
    I18n.t(:empty_name)
  end

  def empty_description_message_error
    I18n.t(:empty_description)
  end

  def wrong_url_image_format_message_error
    I18n.t(:wrong_url_image_format)
  end
end
