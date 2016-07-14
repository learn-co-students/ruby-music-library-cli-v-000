require 'pry'
class MusicImporter
  attr_accessor :path, :songs

  def initialize(path)
    @path = path
    @songs = []
  end

  def songs
    @songs
  end

  def files
    Dir.entries(@path).delete_if {|file| !file.end_with?("mp3")}
  end

  def import
    files.each do |file_name|
       song = Song.create_from_filename(file_name)
       self.songs << song
    end
  end



end
