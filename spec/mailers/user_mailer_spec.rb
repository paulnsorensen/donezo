require 'rails_helper'

describe UserMailer, type: :mailer do
  describe '#task_list' do
    let(:user) { double(email: 'foo@bar.com') }
    let(:tasks) do
      [double(user: user, name: 'I completed task 1', done_at: Time.now)]
    end
    let(:mail) { UserMailer.task_list(user, tasks) }

    it 'sends to the correct user' do
      expect(mail.to).to eql(['foo@bar.com'])
    end

    it 'has the correct subject' do
      expect(mail.subject).to eql('DONEZO | Your tasks')
    end

    it 'is from the correct sender email' do
      expect(mail.from).to eql(['from@example.com'])
    end

    it 'contains a list of tasks' do
      expect(mail.body).to include('I completed task 1')
    end
  end
end
