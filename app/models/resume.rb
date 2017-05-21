class Resume < ApplicationRecord

before_save do |f|
	p "self"
	p self
	p "done"
end

	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   # validates :name, presence: true # Make sure the owner's name is present.
end
