class TaskPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.for_user(user)
    end
  end

  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end

  def create?
    owns_task?
  end

  def update?
    owns_task?
  end

  def destroy?
    owns_task?
  end

  private

  def owns_task?
    task.user_id == user.id
  end
end
