require 'pry'

class MusicImporter

attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    mp3_files = []
    Dir.entries(@path).each do |file|
      if file.include?(".mp3")
        mp3_files << file
      end
    end
    mp3_files
  end

 def import
   files.each {|song| Song.create_from_filename(song)}
 end



end
