class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Done!!'
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:notice] = 'Edit!!'
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'Delete!!'
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:task_name, :deadline, :priority, :status)
  end

end
