require 'pry'
class MusicLibraryController

 def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
 end

 def call

   input = ""
   while input != "exit"

    # puts "Welcome to your music library!",
    #  "To list all of your songs, enter 'list songs'.",
    #  "To list all of the artists in your library, enter 'list artists'.",
    #  "To list all of the genres in your library, enter 'list genres'.",
    #  "To list all of the songs by a particular artist, enter 'list artist'.",
    #  "To list all of the songs of a particular genre, enter 'list genre'.",
    #  "To play a song, enter 'play song'.",
    #  "To quit, type 'exit'.",
    # "What would you like to do?"
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

    end

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
   binding.pry
   #puts all songs -- not hard-coded, numbered list, alphabetized
    Song.all.sort.each_with_index do |song, number|
     puts "#{number + 1}. #{song}"
   end

 end

 def list_artists
   #puts all artists-- numbered, not hard-coded
   Artists.all.each_with_index do|artist, number|
     puts "{number + 1 }. #{artist}"
   end
 end

 def list_genres
   alpha = Genres.all.sort_by{|song| song.name}
   alpha.each_with_index do |genre, number|
     puts "#{number + 1}. #{genre}"
   end
   # same, numbered list, alphabetical order
 end

 def list_songs_by_artist
   input = ""
   puts "Please enter the name of an artist:"
   input = gets.strip
   if input != nil
     find_by_name(input)
     alpha = Artist.songs.all.sort_by{|song| song.name}
     alpha.each_with_index do |song, index|
       puts "#{index + 1}. #{song}"
     end
   end
 end

 def list_songs_by_genre
   input = ""
   puts "Please enter the name of a genre:"
   input = gets.strip
   if input != nil
     find_by_name(input)
     alpha = Genre.songs.all.sort_by{|song| song.name}
     alpha.each_with_index do |song, index|
       puts "#{index + 1}. #{song}"
     end
   end
 end


 def play_song
   list_songs
   input = ""
   puts "Which song number would you like to play?"
   input = gets.strip
   if input.between? 1, number.last#check if valid?
     find_by_name(input)
   end
 end

end
