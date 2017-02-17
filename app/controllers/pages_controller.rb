class PagesController < ApplicationController

	def index
		@page_title = 'Szórakoztató magazin mindenféléről mindenkinek.'
		@page_description = 'Tudtad-e, mindenfelé, lelki egyensúly, szórakozás avagy egy magazin, ami kikapcsol.'
		@posts = Post.where.not(:category_id => nil ).order('created_at DESC').limit(5)
		@randomposts = Post.where.not(:category_id => nil ).where(created_at: 168.hours.ago..Time.now).limit(5).order("RANDOM()")

	end

	def tudtad
		@page_title = 'Tudtad-e ?'
		@page_description = 'Hasznos információk a nagyvilágról.'

		@posts = Post.where(:category_id => '1').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def mindenfele
		@page_title = 'Mindenfelé'
		@page_description = 'Utazás, kirándulás. Tapasztalatok, tippek, ajánlók.'

		@posts = Post.where(:category_id => '2').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def lelki
		@page_title = 'Lelki egyensúly'
		@page_description = 'Harmóniában önmagunkkal és a világgal.'

		@posts = Post.where(:category_id => '3').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end

	def szorakozas
		@page_title = 'Szórakozás'
		@page_description = 'Minden ami szórakoztató lehet.'

		@posts = Post.where(:category_id => '4').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
	end
	
	def show
		@posts = Post.find(params[:id])

		#meta gem -seo - generate post description
		set_meta_tags fb: {
				app_id:		ENV['FB_APPID'],
		}
		set_meta_tags(title: @posts.title+" - "+@posts.category.name,
                      description: @posts.content,
        )
		set_meta_tags og: {
			title: @posts.title,
			type:     'website',
			url: 	'http://mindenfele.hu'+show_post_path(@posts),
			image:    @posts.image.contentimg.url,
		}
	end
	
end