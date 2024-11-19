require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    #binding.pry
    Dir["#{@path}/*.mp3"].collect do |song_name|
      song_name.gsub("#{path}/", "")
    end
  end

  def import
   array = files.each {|x| Song.create_from_filename(x)}
   #binding.pry
  end
end
