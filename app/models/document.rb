require 'byebug'
class Document < ApplicationRecord
  belongs_to :item, inverse_of: :documents

  before_validation :parse_file
  attr_accessor :file_contents
  has_attached_file :file
  validates_attachment :file, presence: true, content_type: { content_type: "application/pdf" }

  private
    def parse_file
      # p file_contents
      file = Paperclip.io_adapters.for(file_contents)
      extention = file.content_type.split("/")[1]
      file.original_filename = ('a'..'z').to_a.shuffle[0..7].join + ".#{extention}"
      self.file = file
    end
end
