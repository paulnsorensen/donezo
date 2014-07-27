class TasksController < ApplicationController
  before_action :authenticate_identity!
  after_action :verify_authorized, except: [:index, :send_task_list]
  after_action :verify_policy_scoped, only: [:index, :send_task_list]

  def index
    if !params[:query].blank?
      @query = params[:query]
      @tasks = policy_scope(Task).search(@query)
    else
      @tasks = policy_scope(Task)
    end
  end

  def create
    params = task_params
    params = params.merge(done_at: Time.now) if params[:done_at].blank?

    task = Task.new(params)

    authorize(task)
    save_task(task)
  end

  def update
    task = Task.find(params[:id]).update_attributes(task_params)

    authorize(task)
    save_task(task)
  end

  def destroy
    task = Task.find(params[:id])

    authorize(task)

    if task.destroy!
      redirect_to action: :index
    else
      redirect_to action: :index, flash: 'Could not destroy task.'
    end
  end

  def send_task_list
    tasks = policy_scope(Task)
    UserMailer.task_list(current_user, tasks).deliver

    redirect_to action: :index
  end

  private

  def task_params
    params
      .require(:task)
      .permit(:name, :description, :done_at)
      .merge(user: current_user)
  end

  def save_task(task)
    if task.save
      redirect_to action: :index
    else
      redirect_to action: :index, flash: 'Could not save task.'
    end
  end
end
