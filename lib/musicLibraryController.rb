class MusicLibraryController
   def initialize(path="./db/mp3s")
      newImport = MusicImporter.new(path)
      newImport.import
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

      resp = "" 
      while resp != "exit" do
         resp = gets
         if resp == "list songs"
            list_songs
         elsif resp == "list artists"
            list_artists
         elsif resp == "list genres"
            list_genres
         elsif resp == "list artist"
            list_songs_by_artist
         elsif resp == "list genre"
            list_songs_by_genre
         elsif resp == "play song"
            play_song
         end
      end
      
   end

   def list_songs
      Song.all.sort_by{|s|s.name}.each_with_index{|s, index| puts "#{index+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
   end

   def list_artists
      Artist.all.sort_by{|a|a.name}.each_with_index{|a,index|puts "#{index+1}. #{a.name}"}
   end

   def list_genres
      Genre.all.sort_by{|g|g.name}.each_with_index{|g,i|puts "#{i+1}. #{g.name}"}
   end

   def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist = gets   
      results = Artist.find_by_name(artist)
      if results != nil
         newRes = results.songs.sort_by{|s|s.name}
         newRes.each_with_index{|a,i| puts "#{i+1}. #{a.name} - #{a.genre.name}"}
      end
   end

   def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre = gets 
      results = Genre.find_by_name(genre)
      if results != nil
         newRes = results.songs.sort_by{|s|s.name}
         newRes.each_with_index{|s,i| puts "#{i+1}. #{s.artist.name} - #{s.name}"}
      end
   end

   def play_song
      puts "Which song number would you like to play?"
      songNum = gets      
      if songNum.to_i <= Song.all.size && songNum.size == 1 && songNum.to_i > 0
         puts "Playing #{Song.all[songNum.to_i].name} by #{Song.all[songNum.to_i].artist.name}"
      end
   end


   
end