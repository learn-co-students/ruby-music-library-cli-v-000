require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
    @all_files = []
  end

  def files
    @all_files = Dir[@path+"/*.mp3"]
    #binding.pry
    @all_files.collect do |file|
      file.split("/").last
    end
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
    #binding.pry
  end
end
