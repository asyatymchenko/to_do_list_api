class TasksController < ApplicationController
	def index # GET all
		tasks = Task.order('id');
		render json: tasks
	end

	def show # GET for id
		task = Task.find(params[:id])
		render json: task
	end

	def create#  POST
		task = Task.create(task_params)	
		render json: task
	end

	def destroy # DELETE
		task = Task.find(params[:id])
		task.destroy
		render json: task
	end

	def update
		task = Task.find(params[:id])
		task.done = task_params[:done]
		task.save
		render json: task
	end

	def rename
		task= Task.find(params[:id])
		task.title = task_params.title
		task.description = task_params.description
		title.done = false
		task.save
		render json: task
	end

	private
    def task_params
      params.require(:task).permit(:title, :done, :description)
    end 
end
