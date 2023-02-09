require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  describe 'sending a friend request' do
    it 'gives a status of pending' do
      user = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user_two)
      friend_request = FriendRequest.create(sent_by: user, sent_to: user_two)
      expect(friend_request.status).to eq('requested')
    end

    it 'does not include the user in the friends list' do
      user = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user_two)
      FriendRequest.create(sent_by: user, sent_to: user_two)
      expect(user.friends.select { |friend| friend == user_two }).not_to be_nil
      expect(user_two.friends.select { |friend| friend == user }).not_to be_nil
    end

    it 'includes the user in the requested_friends list' do
      user = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user_two)
      FriendRequest.create(sent_by: user, sent_to: user_two)
      expect(user.requested_friends.select { |friend| friend == user_two }).not_to be_nil
      expect(user_two.requested_friends.select { |friend| friend == user }).not_to be_nil
    end
  end

  describe 'accepting a friend request' do
    it 'modifies the friends list for both users' do
      user = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user_two)
      friend_request = FriendRequest.create(sent_by: user, sent_to: user_two)
      friend_request.status = 'accepted'
      expect(user.friends.select { |friend| friend == user_two }).not_to be_nil
      expect(user_two.friends.select { |friend| friend == user }).not_to be_nil
    end
  end

  describe 'declining a friend request' do
    it 'does not include the user in the friends list' do
      user = FactoryBot.create(:user)
      user_two = FactoryBot.create(:user_two)
      friend_request = FriendRequest.create(sent_by: user, sent_to: user_two)
      friend_request.status = 'declined'
      expect(user.friends.select { |friend| friend == user_two }).not_to be_nil
      expect(user_two.friends.select { |friend| friend == user }).not_to be_nil
    end
  end
end
