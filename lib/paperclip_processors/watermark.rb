require 'paperclip_processors/watermark'
module Paperclip
  class Watermark < Thumbnail
    def initialize(file, options = {}, attachment = nil)
      super
      @watermark_path = options[:watermark_path]
      @position       = options[:position].nil? ? "SouthEast" : options[:position]
    end

    # def make
    #   src = @file
    #   dst = Tempfile.new([@basename].compact.join("."))
    #   dst.binmode
    #
    #   return super unless @watermark_path
    #
    #   params = "-gravity #{@position} #{transformation_command.join(" ")} #{@watermark_path} :source :dest"
    #
    #   begin
    #      Paperclip.run("composite", params, :source => "#{File.expand_path(src.path)}[0]", :dest => File.expand_path(dst.path))
    #   rescue PaperclipCommandLineError
    #     raise PaperclipError, "There was an error processing the watermark for #{@basename}" if @whiny
    #   end
    #   dst
    # end

    def make
      src = @file
      dst = Tempfile.new([@basename].compact.join("."))
      dst.binmode
      return super unless @watermark_path
      transformation_command_fix=transformation_command.join(" ").sub("-auto-orient ", '')
      params = "-gravity #{@position} #{transformation_command_fix} #{@watermark_path} :source :dest"
      Paperclip.run("composite", params, :source => "#{File.expand_path(src.path)}[0]", :dest => File.expand_path(dst.path))
      dst
    end
  end
end
