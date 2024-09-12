require "pry"
class MusicImporter
  attr_reader :path, :the_songs

  def initialize(path)
    @path = path
  end

  def files
    @the_songs = Dir.entries(@path).delete_if {|x| x.include?(".mp3") == false}
    @the_songs
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end
