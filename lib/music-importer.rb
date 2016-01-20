require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select{ |file| file.include?(".mp3")}
  end

  def import
    files.each do |song_file|
      Song.create_from_filename(song_file)
    end
  end

end