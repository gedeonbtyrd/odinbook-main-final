require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Adding a post' do
    it 'creates a post belonging to a user' do
      user = User.create!(email: 'test@example.com', password: 'abc123')
      post = user.posts.build(content: 'This is a post.')
      post.save
      expect(post.user).to eq(user)
      expect(user.posts.first).to eq(post)
    end
  end

  describe 'Adding a post without a user' do
    it 'is invalid' do
      post = described_class.new(content: 'This is a post.')
      expect(post).to_not be_valid
    end
  end
end
