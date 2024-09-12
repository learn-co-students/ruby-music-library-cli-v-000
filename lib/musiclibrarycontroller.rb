class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    puts "Welcome to your music library!"

    until input == "exit"

    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.strip
    if input == "list songs"
      list_songs
    elsif input == "list artists"
      list_artists
    elsif input == "list genres"
      list_genres
    elsif input == "list artist"
      list_songs_by_artist
    elsif input == "list genre"
      list_songs_by_genre
    elsif input == "play song"
      play_song
    end
  end
  end

 def list_songs
   songs = Song.all
   songs = songs.sort_by {|n| n.name}
   songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
 end

 def list_artists
   artists = Artist.all
   artists = artists.sort_by {|n| n.name}
   artists.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
 end

 def list_genres
   genres = Genre.all
   genres = genres.sort_by {|n| n.name}
   genres.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
 end

 def list_songs_by_artist
   puts "Please enter the name of an artist:"
   name = gets.strip
   artist = Artist.find_by_name(name)
   if artist != nil
   songs = artist.songs.sort_by {|n| n.name}
   songs.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
 end
 end

 def list_songs_by_genre
   puts "Please enter the name of a genre:"
   name = gets.strip
   genre = Genre.find_by_name(name)
   if genre != nil
     songs = genre.songs.sort_by {|n| n.name}
     songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
   end
 end

 def play_song
   puts "Which song number would you like to play?"
   input = gets.strip.to_i
   if input.between?(1, Song.all.length)
   song = Song.all.sort {|a, b| a.name <=> b.name}[input - 1]
   puts "Playing #{song.name} by #{song.artist.name}"
 end
 end


end
