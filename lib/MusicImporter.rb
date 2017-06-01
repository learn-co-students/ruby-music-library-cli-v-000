require_relative "artist.rb"
require_relative "song.rb"

class MusicImporter
  attr_accessor :path, :files
  def initialize(path="")
    @path = path
  end
  def files
    #puts Dir.entries(@path).select{|file| file.end_with?(".mp3")}
    @files = Dir.entries(@path).select{|file| file.end_with?(".mp3")}
  end

  def print_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  def print_artists
    Song.all.each do |song|
      puts "#{song.artist.name}"
    end
  end
  def print_genres
    Genre.all.sort_by{|g| g.name}.each do |g|
      puts g.name
    end
  end
  def print_artists_songs(name)
    artist = Artist.find_by_name(name)
    if(artist.nil?)
      puts "Artist does not exist!"
      return
    end
    artist.songs.each do |song|
      puts "#{name} - #{song.name} - #{song.genre.name}"
    end
  end
  def print_genre_songs(name)
    genre = Genre.find_by_name(name)
    if(genre.nil?)
      puts "Genre does not exist!"
      return
    end
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{name}"
    end
  end
  def play_song(playlist_index)
    if(playlist_index < 1 || playlist_index > @files.size)
      puts "Out of bound playlist track index!"
      return
    end
    s = Song.all[playlist_index - 1]
    puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
  end
  def import
    files.each do |file|
      song = Song.create_from_filename(file)
    end
    Song.all.sort_by!{|s| s.artist.name}
  end
end
