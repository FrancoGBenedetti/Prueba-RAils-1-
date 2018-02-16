class TodosController < ApplicationController
	def index
		@todo = Todo.all
	end

	def new
		@todo = Todo.new
	end

	def create
		todo = Todo.new(todo_params)

		if todo.save
			redirect_to todo, notice: 'ToDo Creado Exitosamente'
		else
			redirect_to todos_new_path, notice: 'Oops! Parece haber un problema!'
		end

	end

	def show
		@todo = Todo.find(params[:id])
	end

	def edit
		@todo = Todo.find(params[:id])
	end


	def update
		@todo = Todo.find(params[:id])
		if @todo.update(todo_params)
			redirect_to root_path, notice: 'Wow un post fue actualizado'
		else
			redirect_to edit_post(todo)
		end
	end

	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy
		redirect_to root_path, notice: 'Uff!, se a eliminado un Todo!'
	end

	def complete
		@todo = Todo.find(params[:id])
		@todo.completed = true

		if @todo.save
			redirect_to root_path, notice: 'Tarea Completada'
		else
			redirect_to root_path, notice: 'Ohoh! Parece que hay un problema!'
		end
	end

	def list
		@todos = Todo.all
		
	end


	private

	def todo_params
		params.require(:todo).permit(:description)
	end
end
