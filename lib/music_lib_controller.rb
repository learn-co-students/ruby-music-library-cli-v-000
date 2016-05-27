# require 'pry'
# require_relative './../config/environment.rb'

class MusicLibraryController

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call

    # puts "list songs"
    # puts "exit"
    input = ""
    while input != "exit"
      puts "What's up Dude? What do you want to do?"
      input = gets.strip
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        number = gets.strip.to_i
        play_song(number)
      when "list artist"
        name = gets.strip
        list_artist(name)
      when "list genre"
        name = gets.strip
        list_genre(name)
      end
    end
  end

  def sort_songs_by_artist
    Song.all.sort {|a, b| a.artist.name <=> b.artist.name}
  end

  def list_songs
    counter = 1
    self.sort_songs_by_artist.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    self.sort_songs_by_artist.each do |song|
      puts "#{song.artist.name}"
    end
  end

  def list_genres
    self.sort_songs_by_artist.each do |song|
      puts "#{song.genre.name}"
    end
  end

  def play_song(number)
    current_song_instance = self.sort_songs_by_artist[number - 1]
    puts "Playing #{current_song_instance.artist.name} - #{current_song_instance.name} - #{current_song_instance.genre.name}"
  end

  def list_artist(name)
    artist = Artist.find_by_name(name)
    artist.songs.each do |song|
      puts "#{artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre(name)
    genre = Genre.find_by_name(name)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{genre.name}"
    end
  end

end

# essay = MusicLibraryController.new
# essay.call
