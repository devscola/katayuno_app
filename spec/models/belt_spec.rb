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
    expect(belt.errors[:name]).to eq(["can't be blank"])
    expect(belt.errors[:description]).to eq(["can't be blank"])
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
    expect(belt.errors[:image]).to eq(["is invalid"])
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
end
