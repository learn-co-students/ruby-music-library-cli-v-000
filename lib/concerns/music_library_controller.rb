require 'pry'

class MusicLibraryController

  attr_accessor :path, :music_importer

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    #greet the user
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end


  def list_songs
    sorted_list = Song.all.sort {|a,b| a.name <=> b.name}
    #binding.pry
    sorted_list.each.with_index(1) do |song, index|
      #binding.pry
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_list = Artist.all.sort {|a,b| a.name <=> b.name}
    sorted_list.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end


  def list_genres
    sorted_list = Genre.all.sort {|a,b| a.name <=> b.name}
    sorted_list.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
  end

  def list_songs_by_genre
  end

  def play_song
  end

end
