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
end
