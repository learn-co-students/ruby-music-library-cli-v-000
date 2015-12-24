require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  

  def files
    entry_array = []
    Dir.entries(path).each do |entry|
      entry_array << entry if entry.include?("mp3")
    end
    entry_array
  end

  def import
    files.each do |filename|
      filename = filename.split(" - ")
      artist_name = filename[0]
      song_name = filename[1]
      genre_name = filename[2].chomp(".mp3")
      song = Song.find_or_create_by_name(song_name)
      song.artist = Artist.find_or_create_by_name(artist_name)
      song.genre = Genre.find_or_create_by_name(genre_name)
      song
    end
  end
end