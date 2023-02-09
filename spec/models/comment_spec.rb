require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'A user commenting on a post' do
    it 'creates a relationship that can be found with "post.comments"' do
      user = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user_two)
      post = user.posts.first
      comment = Comment.create(post: post, user: user_two, content: 'This is great!')
      expect(post.comments.first).to eq(comment)
    end

    it 'creates a relationship that can be found with "user.comments' do
      user = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user_two)
      post = user.posts.first
      comment = Comment.create(post: post, user: user_two, content: 'This is great!')
      expect(user_two.comments.first).to eq(comment)
    end
  end
end
