class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
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
     when "exit"
     end
   end

   def list_songs
     sorted = Song.all.sort_by {|s| s.name}
     sorted.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
   end

   def list_artists
     sorted = Artist.all.sort_by {|a| a.name}
     sorted.each_with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
   end

   def list_genres
     sorted = Genre.all.sort_by {|g| g.name}
     sorted.each_with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
   end

   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     the_artist = gets.chomp
     if Artist.find_by_name(the_artist) != nil
      sorted = Artist.find_by_name(the_artist).songs.sort_by {|s| s.name}
      sorted.each_with_index {|s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"}
     end
   end

   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     the_genre = gets.chomp
     if Genre.find_by_name(the_genre) != nil
      sorted = Genre.find_by_name(the_genre).songs.sort_by {|s| s.name}
      sorted.each_with_index {|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name}"}
    end
   end

   def play_song
     puts "Which song number would you like to play?"
     list = (Song.all.sort_by {|s| s.name}).to_a
     #input is the user's song number selection
     input = gets.chomp.to_i
     #choice is the song object referenced by the user's input selection from the numbered list of alphabetized songs.
     choice = list[input - 1]
     #the input cannot be nil, and must be a number less than the total number of songs in the library's list.
     if input != nil && (input <= list.size) && (input >= 1)
     puts "Playing #{choice.name} by #{choice.artist.name}"
    end
   end
end
end
