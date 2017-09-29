require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s") #accepts a path to import music; default
    @path = path
    new_importer = MusicImporter.new(path)
    new_importer.import
  end

  def call
    input = nil 
    while input != "exit"
      puts "Welcome to the Music Library."
      puts "Here are your options:"
      puts "list songs
            \nlist artists
            \nlist genres
            \nplay song
            \nlist an artist's songs use 'list artist'
            \nlist a genre's songs use 'list genre'
            \n exit" 
      puts "What would you like to do? > "
      input = gets.chomp

      case input
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "play song"
          play_song
        when "list artist"
          list_artist_songs
        when "list genre"
          list_genre_songs
        when "exit"
          break
      end
    end
  end 

  def list_songs
    Song.all.each_with_index do |value, index|
      puts "#{index+1}. #{value.artist.name} - #{value.name} - #{value.genre.name}"
    end 
  end

  def list_artists
    Song.all.each do |song|
      puts "#{song.artist.name}"
    end
  end

  def list_genres
    Song.all.each do |song|
      puts "#{song.genre.name}"
    end
  end

  def play_song
    puts "Please enter a song number> "
    song_number = gets.chomp.to_i
    selected_song = Song.all[song_number-1]
    puts "Playing #{selected_song.artist.name} - #{selected_song.name} - #{selected_song.genre.name}"
  end

  def list_artist_songs
    puts "Please type the artist name> "
    selected_artist_string = gets.chomp
    selected_artist_object = Artist.find_or_create_by_name(selected_artist_string)
    selected_artist_object.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end

  def list_genre_songs
    puts "Please type the genre name> "
    selected_genre_string = gets.chomp
    selected_genre_object = Genre.find_or_create_by_name(selected_genre_string)
    selected_genre_object.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end