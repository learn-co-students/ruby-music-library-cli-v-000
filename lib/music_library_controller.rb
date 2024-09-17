class MusicLibraryController
  attr_accessor :path

     def initialize(path='./db/mp3s')
       @path = path
       music_importer = MusicImporter.new(path)
       music_importer.import
     end

     def call
        puts("Welcome to your music library!")
        puts("To list all of your songs, enter 'list songs'.")
        puts("To list all of the artists in your library, enter 'list artists'.")
        puts("To list all of the genres in your library, enter 'list genres'.")
        puts("To list all of the songs by a particular artist, enter 'list artist'.")
        puts("To list all of the songs of a particular genre, enter 'list genre'.")
        puts("To play a song, enter 'play song'.")
        puts("To quit, type 'exit'.")
        puts("What would you like to do?")
        input = gets
        list_songs if input == "list songs"
        list_artists if input == "list artists"
        list_genres if input == "list genres"
        list_songs_by_artist if input == "list artist"
        list_songs_by_genre if input == "list genre"
        play_song if input == "play song"
        call if input != "exit"
     end

   def list_songs
    sorted = Song.all.sort_by {|song| song.name}
    sorted.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted = Artist.all.sort_by {|artist| artist.name}
    sorted.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    sorted = Genre.all.sort_by {|genre| genre.name}
    sorted.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    input = ""
    puts "Please enter the name of an artist:"
    input = gets.strip #since input is a string, must be "converted" to an object!!!!!
    if artist_object = Artist.find_by_name(input)
       sorted = artist_object.songs.sort_by {|song| song.name}
       sorted.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    input = ""
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre_object = Genre.find_by_name(input)
       sorted = genre_object.songs.sort_by {|song| song.name}
       sorted.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    input = ""
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input >= 1 && Song.all.length >= input
      sorted = Song.all.sort_by {|song| song.name}
      song = sorted[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
