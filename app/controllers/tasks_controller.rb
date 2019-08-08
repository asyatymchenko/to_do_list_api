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
		task = Task.new(task_params)
		render json: task
	end

	def destroy # DELETE
		task = Task.find(params[:id])
		task.destroy
		render json: task
		#render json: {status: 'SUCCESS', message: 'task deleted', data:task}, status: :ok
	end

	def update
		task = Task.find(params[:id])
		#task.done = !(task.done)
		task.done = task_params[:done]
		task.title = task_params[:title]
		task.save
		render json: task
	end
	#private
	#def task_params
	#	params.permit(:title, :checked)
	#end

	private
    def task_params
      params.require(:task).permit(:title, :done)
    end 
end
