class AutorsController < ApplicationController

	before_action :set_autor, only: [:show, :edit, :update, :destroy]

	def index
		@autors = Autor.all
	end

	def show

	end

	def new
		@autor = Autor.new
	end

	def create
		@autor = Autor.new(autor_params)
		if @autor.save
			redirect_to @autor, success: 'Autor create'
		else
			render :new, danger: 'Autor Autor create'
		end
	end

	def edit

	end

	def update
		if @autor.update_attributes(autor_params)
			redirect_to @autor, success: 'Autor update'
		else
			render :edit, danger: 'Autor don`t update'
		end
	end

	def destroy
		@autor.destroy
		redirect_to autors_path, success: 'Autor delet'
	end

	

	private

	def set_autor
		@autor = Autor.find(params[:id])
	end

	def autor_params
		params.require(:autor).permit(:last_name, :name, :year_of_birth, :year_of_death)
	end
end