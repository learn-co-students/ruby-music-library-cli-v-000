class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.strip
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
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
    Song.all.sort{|a,b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
     Artist.all.sort{|a,b| a.name <=> b.name }.each.with_index(1) do |a, i|
       puts "#{i}. #{a.name}"
     end
   end

   def list_genres
     Genre.all.sort{|a,b| a.name <=> b.name }.each.with_index(1) do |g, i|
       puts "#{i}. #{g.name}"
     end
   end

   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     artist_input = gets.strip
     if artist = Artist.find_by_name(artist_input)
       artist.songs.sort{|a,b| a.name <=> b.name }.each.with_index(1) do |s,i|
         puts "#{i}. #{s.name} - #{s.genre.name}"
       end
     end
   end

   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     genre_input = gets.strip
     if genre = Genre.find_by_name(genre_input)
       genre.songs.sort{|a,b| a.name <=> b.name }.each.with_index(1) do |s,i|
         puts "#{i}. #{s.artist.name} - #{s.name}"
       end
     end
   end

   def play_song
     puts "Which song number would you like to play?"
     song_input = gets.strip.to_i
      if (1..Song.all.length).include?(song_input)
        song = Song.all.sort{ |a,b| a.name <=> b.name}[song_input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
   end
end
end
