require 'elasticsearch/model'
class Post < ActiveRecord::Base
  	belongs_to  :category
  	mount_uploader :image, ImageUploader

  	#for post carousels
  	has_many :post_attachments
   	accepts_nested_attributes_for :post_attachments
	
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

		  settings index: { number_of_shards: 1 } do
		    mappings dynamic: 'false' do
		      indexes :title, analyzer: 'stop', index_options: 'offsets'
		      indexes :content, analyzer: 'stop'
		    end
		  end	

	  	def self.search(query)
	    __elasticsearch__.search(
	      {
	        query: {
	          multi_match: {
	            query: query,
	            fields: ['title^10', 'content']
	          }
	        },
	        highlight: {
	          pre_tags: ['<em>'],
	          post_tags: ['</em>'],
	          fields: {
	            title: {},
	            content: {}
	          }
	        }
	      }
	    )
  		end
end

# Delete the previous Post index in Elasticsearch
Post.__elasticsearch__.client.indices.delete index: Post.index_name rescue nil

# Create the new index with the new mapping
Post.__elasticsearch__.client.indices.create \
  index: Post.index_name,
  body: { settings: Post.settings.to_hash, mappings: Post.mappings.to_hash }
# Index all article records from the DB to Elasticsearch
Post.import