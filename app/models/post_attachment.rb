class PostAttachment < ActiveRecord::Base
	mount_uploader :post_carouselimage, ImageUploader
   	belongs_to :post
end
