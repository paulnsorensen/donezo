class TasksController < ApplicationController
  before_action :authenticate_identity!

  def index
    if !params[:query].blank?
      @query = params[:query]
      @tasks = Task.for_user(current_user).search(@query)
    else
      @tasks = Task.for_user(current_user)
    end
  end

  def create
    params = task_params
    params = params.merge(done_at: Time.now) if params[:done_at].blank?

    task = Task.new(params)

    save_task(task)
  end

  def update
    task = Task.find(params[:id]).update_attributes(task_params)

    save_task(task)
  end

  def send_task_list
    UserMailer.task_list(current_user).deliver

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
