require 'pry'

class MusicImporter

  attr_accessor :path, :file_name
  @path = []

  def initialize(path) #accepts file path to parse mp3 files
    @path = path
  end

  def files #loads all mp3 files in the path directory
    #normalizes the filename to just the mp3 filename w/no path
      Dir.glob(path+"/*.mp3").collect {|file| file.sub(path+"/", "") }
   end

  def import
      files.each {|file_name| Song.create_from_filename(file_name)}
  end

end
