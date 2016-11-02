require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    filenames = Dir["#{@path}/*"]
    @files_array = filenames.collect {|path| path.gsub("./spec/fixtures/mp3s/", "")}
  end

  def import
    self.files.each do |filename|
      filename = filename.gsub(".mp3","")
      song_data = filename.split(" - ")

      song_name = song_data[1] #song name -- string, not Song object
      genre_name = song_data[2] # genre name -- string, not Genre object
      artist_name = song_data[0] #artist name -- string, not Artist object

      song = Song.find_or_create_by_name(song_name) #new song with artist object and genre object params
      song.artist = Artist.find_or_create_by_name(artist_name)
      song.genre = Genre.find_or_create_by_name(genre_name)
    end
  end
end
