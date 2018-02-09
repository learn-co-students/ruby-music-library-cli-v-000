require 'pry'
class MusicImporter
  # build initialize..... remebre
  attr_accessor :path, :files

    def initialize(path)
      #path is just a path way...  "./spec/fixtures/mp3s"
      # path was already giving to use. So we just tap into it
      @path = path
    end

  def files
    #@files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    #   OR
    @files = Dir.entries(@path)
    @files.delete(".")
    @files.delete("..")
    @files
  #call the file to get 4
    #operate on the files to normalize the filename to not have the mp3 at the end
  end

  def import
     self.files.each do |file|
     Song.create_from_filename(file)  # we go into the Song Class to use this..
  end
  end
end
