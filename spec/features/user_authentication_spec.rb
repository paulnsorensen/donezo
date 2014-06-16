require 'rails_helper'

feature 'User authentication', type: :feature do
  scenario 'logs in a user' do
    create_identity

    visit root_path

    click_link 'Log in'
    fill_in 'Email', with: 'foo@bar.com'
    fill_in 'Password', with: 'password132'
    check 'Remember me'
    click_button 'Sign in'

    expect(current_path).to eql(tasks_path)
  end

  scenario 'logs out a user' do
    login

    visit root_path

    click_link 'Log out'

    expect(current_path).to eql(root_path)
  end

  scenario 'allows a user to sign up' do
    visit root_path

    click_link 'Sign up'

    fill_in 'Email', with: 'bar@baz.com'
    fill_in 'Password', with: 'password12'
    fill_in 'Password confirmation', with: 'password12'
    click_button 'Sign up'

    expect(current_path).to eql(tasks_path)
  end
end
