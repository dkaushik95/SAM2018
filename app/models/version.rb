class Version < ApplicationRecord
	belongs_to :paper
	has_attached_file :document, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
	validates :document, :attachment_content_type => { :content_type => ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']}

	def document_remote_url=(url_value)
	    self.document = URI.parse(url_value)
	    # Assuming url_value is http://example.com/photos/face.png
	    # avatar_file_name == "face.png"
	    # avatar_content_type == "image/png"
	    @avatar_remote_url = url_value
	  end
end
