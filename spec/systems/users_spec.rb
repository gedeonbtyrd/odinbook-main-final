require 'rails_helper'

RSpec.describe 'Users system', type: :system do
  it 'redirects to sign-in page when user is not signed-in' do
    visit('/')
    expect(current_path).to have_content('/users/sign_in')
  end

  it 'logs in a known user and redirects to root path' do
    visit('/')
    expect(current_path).to have_content('/users/sign_in')

    fill_in('Email', with: 'jane_smith@test.com')
    fill_in('Password', with: 'abc123')
    click_button('Log in')

    expect(current_path).to have_content('/')
  end

  it 'creates a new user' do
    visit('/')
    click_link('Sign up')

    fill_in('Email', with: 'new_user_test@example.com')
    fill_in('Password', with: 'abc123')
    fill_in('Password confirmation', with: 'abc123')
    fill_in('Name', with: 'User Test')
    fill_in('Location', with: 'London, UK')
    fill_in('Birthday', with: '1990-01-01')
    click_button('Sign up')

    expect(User.last.email).to eq('new_user_test@example.com')
  end
end
