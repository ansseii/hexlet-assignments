# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new task_params
    if @task.save
      flash[:notice] = 'Task has been created'
      redirect_to @task
    else
      flash[:warn] = 'Please, fix the errors'
      render :new, status: :unprocessable_content
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update task_params
      flash[:notice] = 'Task has been updated'
      redirect_to @task
    else
      flash[:warn] = 'Please, fix the errors'
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = 'Task has been deleted'
      redirect_to tasks_path
    else
      flash[:warn] = 'Failed to delete task'
      redirect_back fallback_location: :tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(
      :name, :description, :status,
      :creator, :performer, :completed
    )
  end
end
