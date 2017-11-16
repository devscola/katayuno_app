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
end
