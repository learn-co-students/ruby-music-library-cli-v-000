require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    o = MusicImporter.new(path)
    o.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    songs_alphabetized = Song.all.sort_by &:name
    songs_alphabetized.each_with_index { |val,index| puts "#{index + 1}. #{val.artist.name} - #{val.name} - #{val.genre.name}"}
  end

  def list_artists
    artists_alphabetized = Artist.all.sort_by &:name
    artists_alphabetized.each_with_index { |val,index| puts "#{index + 1}. #{val.name}"}
  end

  def list_genres
    genres_alphabetized = Genre.all.sort_by &:name
    genres_alphabetized.each_with_index { |val,index| puts "#{index + 1}. #{val.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
       if artist
         artist_songs = artist.songs
         artist_songs_alphabetized = artist_songs.sort_by &:name
         artist_songs_alphabetized.each_with_index do |val,index|
           puts "#{index + 1}. #{val.name} - #{val.genre.name}"
         end
       end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
       if genre
         songs_by_genre = genre.songs
         songs_by_genre_alphabetized = songs_by_genre.sort_by &:name
         songs_by_genre_alphabetized.each_with_index do |val,index|
           puts "#{index + 1}. #{val.artist.name} - #{val.name}"
         end
       end
  end

  def play_song
    #input = ""
    #while input < 1 && input > 5
      #list_songs
      puts "Which song number would you like to play?"
      input = gets.strip
      case input
      when "1"
        "Playing song 1"
      when "2"
        "Playing song 2"
      when "3"
        "Playing song 3"
      when "4"
        "Playing song 4"
      when "5"
        "Playing song 5"
      end
    #end




  end

end
