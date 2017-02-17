class PagesController < ApplicationController
	include ActionView::Helpers::TextHelper


	def index
		@posts = Post.where.not(:category_id => nil ).order('created_at DESC').limit(5)
		@randomposts = Post.where.not(:category_id => nil ).where(created_at: 168.hours.ago..Time.now).limit(5).order("RANDOM()")

		#meta gem -seo - generate metacontent
		@page_title = 'Szórakoztató magazin mindenféléről mindenkinek.'
		@page_description = 'Tudtad-e, mindenfelé, lelki egyensúly, szórakozás avagy egy magazin, ami kikapcsol.'
	end

	def tudtad
		@posts = Post.where(:category_id => '1').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)

		#meta gem -seo - generate metacontent
		@page_title = 'Tudtad-e ?'
		@page_description = 'Hasznos információk a nagyvilágról.'
	end

	def mindenfele
		@posts = Post.where(:category_id => '2').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)

		#meta gem -seo - generate metacontent
		@page_title = 'Mindenfelé'
		@page_description = 'Utazás, kirándulás. Tapasztalatok, tippek, ajánlók.'
	end

	def lelki
		@posts = Post.where(:category_id => '3').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)

		#meta gem -seo - generate metacontent
		@page_title = 'Lelki egyensúly'
		@page_description = 'Harmóniában önmagunkkal és a világgal.'
	end

	def szorakozas
		@posts = Post.where(:category_id => '4').order('created_at DESC').paginate(:page => params[:page], :per_page => 3)

		#meta gem -seo - generate metacontent
		@page_title = 'Szórakozás'
		@page_description = 'Minden ami szórakoztató lehet.'
	end
	
	def show
		@posts = Post.find(params[:id])

		#meta gem -seo - generate post description
		set_meta_tags(
				title: @posts.title+" - "+@posts.category.name,
				description: @posts.content,
		)
		set_meta_tags og: {
				title: @posts.title,
				type:     'website',
				url: 	'http://mindenfele.hu'+show_post_path(@posts),
				image:    @posts.image.contentimg.url,
				description: strip_tags(@posts.content).gsub(/\s+/, " ").first(300),
		}
	end
	
end