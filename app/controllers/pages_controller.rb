class PagesController < ApplicationController

	def index
		@page_title = 'Főoldal'
		@posts = Post.where.not(:category_id => nil ).order('created_at DESC').limit(5)
		@randomposts = Post.where.not(:category_id => nil ).where(created_at: 168.hours.ago..Time.now).limit(5).order("RANDOM()")

	end

	def tudtad
		@page_title = 'Tudtad-e ?'
		@posts = Post.where(:category_id => '1').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def mindenfele
		@page_title = 'Mindenfelé'
		@posts = Post.where(:category_id => '2').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def lelki
		@page_title = 'Lelki egyensúly'
		@posts = Post.where(:category_id => '3').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def szorakozas
		@page_title = 'Szórakozás'
		@posts = Post.where(:category_id => '4').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end
	
	def show
		@posts = Post.find(params[:id])
		#meta gem -seo - generate post description
		#@page_description = Post.find(params[:id]).content
		set_meta_tags(title: @posts.category.name+" | "+@posts.title,
                      description: @posts.content,)
		set_meta_tags og: {
			title: @posts.title	
			type:     'website',
			url: 	'www.mindenfele.hu/'+show_post_path(@posts)
			image:    @posts.image.thumb.url,
		}

		
	end
	
end