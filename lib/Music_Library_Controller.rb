  require 'pry'
class MusicLibraryController
 attr_accessor :path, :files

  def initialize(path ='./db/mp3s')
    @path = path
    musicimporter= MusicImporter.new(path)
    musicimporter.import
   end

   def call
    list = ""
    while list != "exit" #exit is a method in ruby,, use as a string here.
      puts "What would you like to do?"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      input = gets.strip   # this is you CLI in the music_library_controller method
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list particular artist"
        list_particular genres
      elsif input == "list particular genre"
        list_particular genre
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      elsif input == "exit"
    return
      end
    end
  end

    def list_songs
    sorted_songs = Song.all.sort_by { |song| song.name }
    sorted_songs.each_with_index do |song, index|
    puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    end

    def list_artists
    sorted_artists = Artist.all.sort_by { |artist| artist.name }
    sorted_artists.each_with_index do |artist, index|
    puts "#{index + 1}. #{artist.name}"
    end
    end

    def list_genres
    sorted_genres = Genre.all.sort_by { |genres| genres.name }
    sorted_genres.each_with_index do |genres, index|
    puts "#{index + 1}. #{genres.name}"
    end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip #get artist name or string
      artist = Artist.find_by_name(input)
      artist
    if artist
      sorted_songs = artist.songs.sort_by{ |song| song.name }
      sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"

    end
    end
    end


    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip # get genre string
      genre = Genre.find_by_name(input)
      genre
    if genre
      sorted_genres = genre.songs.sort_by{ |genre| genre.name }
      sorted_genres.each_with_index do |song, index|  #we are done with genre heree...
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
    end
    end

     def play_song
     puts "Which song number would you like to play?"
      input = gets.strip
      index = input.to_i - 1 #best the first song start at 0
      returned_song = Song.all.sort_by { |song| song.name }[index]
      #if it nil... we know no song is found.

      if  returned_song != nil &&  index >= 0 && index < Song.all.length
      puts "Playing #{returned_song.name} by #{returned_song.artist.name}"

      end
     end


end
