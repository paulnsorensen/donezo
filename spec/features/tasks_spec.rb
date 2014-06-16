require 'rails_helper'

feature 'Tasks', type: :feature do
  before { login }
  let(:user) { Identity.first.user }

  scenario 'adding a task' do
    visit tasks_path

    fill_in 'task[name]', with: 'Refactored the User model'

    expect { click_button 'Add' }.to change(Task, :count).by(1)
  end

  scenario 'searching tasks' do
    Task.create!(user: user, name: 'I completed task 1', done_at: Time.now)
    Task.create!(user: user, name: 'I completed task 2', done_at: Time.now)

    visit tasks_path

    fill_in 'query', with: 'task 1'
    click_on 'Search'

    expect(page.body).to include('task 1')
    expect(page.body).to_not include('task 2')
  end
end
