class PagesController < ApplicationController

	def index
		@posts = Post.order('created_at DESC').limit(5)
		@randomposts = Post.where(updated_at: 168.hours.ago..Time.now).limit(5).order("RANDOM()")

	end

	def tudtad
		@posts = Post.where(:category_id => '1').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def mindenfele
		@posts = Post.where(:category_id => '2').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def lelki
		@posts = Post.where(:category_id => '3').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def szorakozas
		@posts = Post.where(:category_id => '4').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end
	
	def show
		@posts = Post.find(params[:id])
	end
	
end