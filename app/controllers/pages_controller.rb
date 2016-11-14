class PagesController < ApplicationController

	def index

	end

	def tudtad
		@posts = Post.where(:category_id => '1').paginate(:page => params[:page], :per_page => 3)
	end

	def mindenfele
		@posts = Post.where(:category_id => '2').paginate(:page => params[:page], :per_page => 3)
	end

	def lelki
		@posts = Post.where(:category_id => '3').paginate(:page => params[:page], :per_page => 3)
	end

	def szorakozas
		@posts = Post.where(:category_id => '4').paginate(:page => params[:page], :per_page => 3)
	end
	
	def show
		@posts = Post.find(params[:id])
	end
	
end