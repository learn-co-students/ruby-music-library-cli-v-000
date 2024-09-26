class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""

    input != exit
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

   def list_songs
  songs_alphabetized = Song.all.sort_by do |song|
    song.name
   end
    songs_list = songs_alphabetized.each_with_index do |song, index|
    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
 end

   def list_artists
     artist_list = Artist.all.collect do |artist|
       artist.name
   end
     artist_list.sort.uniq.each_with_index { |name, index| puts "#{index+1}. #{name}" }
   end

   def list_genres
     genre_list = Genre.all.collect do |genre|
       genre.name
   end
     genre_list.sort.uniq.each_with_index { |name, index| puts "#{index+1}. #{name}" }
   end

   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     input = gets.strip
     if artist = Artist.find_by_name(input)
       song = artist.songs.sort_by { |song| song.name }
       song.each_with_index do |song, index|
         puts "#{index+1}. #{song.name} - #{song.genre.name}"
       end
     end
   end

   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     input = gets.strip
     if genre = Genre.find_by_name(input)
       songs = genre.songs.sort_by { |song| song.name }
       songs.each_with_index do |song, index|
         puts "#{index+1}. #{song.artist.name} - #{song.name}"
       end
     end
   end

   def play_song
      puts "Which song number would you like to play?"
    index = gets.strip.to_i - 1
    songs = Song.all.sort_by {|song| song.name}
      if (1..songs.length).include?(index)
    song = songs[index]
      puts "Playing #{song.name} by #{song.artist.name}" if song
      end
    end


   end
