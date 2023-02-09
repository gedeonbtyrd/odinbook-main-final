require 'rails_helper'

RSpec.describe 'New post', type: :system do
  xit 'successfully creates a new post' do
    # Removed test after implementing Turbo Frames and Streams
    user = User.create!(email: 'test@example.com', password: 'abc123')
    sign_in user
    visit new_post_path
    expect(page).to have_button('Post')

    fill_in 'Content', with: 'This is the system test for a new post.'
    click_button('Post')

    expect(page).to have_content('This is the system test for a new post.')
  end

  it 'successfully creates a new post from the root page' do
    user = FactoryBot.create(:user)
    sign_in user
    visit root_path

    fill_in 'Content', with: 'This is the system test for a new post made from the root page.'
    click_button('Post')

    expect(page).to have_content('This is the system test for a new post made from the root page.')
  end

  it 'successfully creates a new post from the user show page' do
    user = FactoryBot.create(:user)
    sign_in user
    visit user_path(user)

    fill_in 'Content', with: 'This is the system test for a new post made from the user show page.'
    click_button('Post')

    expect(page).to have_content('This is the system test for a new post made from the user show page.')
  end
end
