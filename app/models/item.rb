class Item < ApplicationRecord
  has_many :documents, inverse_of: :item

  before_validation :parse_image
  attr_accessor :image_base
  attr_accessor :document_data

  has_attached_file :picture, styles: { medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png"
  do_not_validate_attachment_file_type :picture


  def save_attachments(params)
    params[:document_data].each do |doc|
      self.documents.create(:file_contents => doc)
    end
  end

  private
    def parse_image
      image = Paperclip.io_adapters.for(image_base)
      extention = image.content_type.split("/")[1]
      image.original_filename = ('a'..'z').to_a.shuffle[0..7].join + ".#{extention}"
      self.picture = image
    end
end
