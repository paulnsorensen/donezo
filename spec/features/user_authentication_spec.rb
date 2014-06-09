require 'rails_helper'

describe 'User authentication', type: :feature do
  it 'logs in a user' do
    create_identity

    visit root_path

    click_link 'Log in'
    fill_in 'Email', with: 'foo@bar.com'
    fill_in 'Password', with: 'password132'
    check 'Remember me'
    click_button 'Sign in'

    expect(current_path).to eql(tasks_path)
  end

  it 'logs out a user' do
    login_as(create_identity, scope: :identity)

    visit root_path

    click_link 'Log out'

    expect(current_path).to eql(root_path)
  end

  it 'allows a user to sign up' do
    visit root_path

    click_link 'Sign up'

    fill_in 'Email', with: 'bar@baz.com'
    fill_in 'Password', with: 'password12'
    fill_in 'Password confirmation', with: 'password12'
    click_button 'Sign up'

    expect(current_path).to eql(tasks_path)
  end

  def create_identity
    Identity.create!(
      email: 'foo@bar.com',
      password: 'password132',
      password_confirmation: 'password132'
    )
  end
end
