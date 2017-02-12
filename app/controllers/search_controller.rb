class SearchController < ApplicationController
	def search
	  if params[:q].nil?
	    @posts = []
	  else
	    @posts = Post.search(params[:q]).records.where.not(:category_id => nil )
	  end
	end
end
