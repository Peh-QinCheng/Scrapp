class Item < ActiveRecord::Base
	mount_uploader :picture, ProductImageUploader
end
