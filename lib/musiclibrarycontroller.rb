class MusicLibraryController

   def initialize(path = "./db/mp3s")
     MusicImporter.new(path).import
   end

   def call
     puts "Welcome to your music library!"
     puts "To list all of your songs, enter 'list songs'."
     puts "To list all of the artists in your library, enter 'list artists'."
     puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     puts "What would you like to do?"
     user_input = gets.chomp
     case user_input
     when "list songs"
       self.list_songs
     when "list artists"
       self.list_artists
     when "list genres"
       self.list_genres
     when "list artist"
       self.list_songs_by_artist
     when "list genre"
       self.list_songs_by_genre
     when "play song"
       self.play_song
     when "exit"
       'exit'
     else
       call
     end
   end


   def list_songs
     Song.all.each_with_index {|song,index|puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
   end

   def list_artists
      Artist.all.each_with_index {|artist,index|puts "#{index+1}. #{artist.name}"}
   end

   def list_genres
     Genre.all.each_with_index {|genre,index|puts "#{index+1}. #{genre.name}"}
   end

   def list_songs_by_artist
      puts "Please enter the name of an artist:"
      user_input = gets.chomp
      artist_songs =[]
      self.library.each do |song|
          if song.artist.name == user_input
            artist_songs << song
          end
      end
      artist_songs = artist_songs.sort_by{|song|song.name}
      artist_songs.each {|song|puts "#{artist_songs.index(song) + 1}. #{song.name} - #{song.genre.name}"} unless artist_songs == nil
    end




   def play_song
     song = Song.all[gets.to_i - 1]
     puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end

   def list_artist
     puts "Enter artist"
     specific_artist = gets.chomp
     if Artist.find_by_name(specific_artist) != nil
       Artist.find_by_name(specific_artist).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
     else
       puts "Artist does not exist"
     end
   end



   def list_genre
     puts "Enter genre"
     specific_genre = gets.chomp
     if Genre.find_by_name(specific_genre) != nil
       Genre.find_by_name(specific_genre).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
     else
       puts "Genre does not exist"
     end
   end

 end
