class UserMailer < ActionMailer::Base
  default from: 'from@example.com'

  def task_list(user)
    @tasks = Task.for_user(user)
    mail(to: user.email, subject: 'DONEZO | Your tasks')
  end
end
