class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = MusicImporter.new(path)
    @path.import
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

    if user_input == "list songs"
      list_songs
      call
    elsif user_input == "list artists"
      list_artists
      call
    elsif user_input == "list genres"
      list_genres
      call
    elsif user_input == "list artist"
      list_songs_by_artist
      call
    elsif user_input == "list genre"
      list_songs_by_genre
      call
    elsif user_input == "play song"
      play_song
      call
    elsif user_input == "exit"
      return
    else
      call
    end
  end

  def list_songs
    counter = 1

    song_list = Song.all.sort_by { |song| song.name }
      song_list.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        counter += 1
      end
  end

  def list_artists
    counter = 1

    artist_list = Artist.all.sort_by { |artist| artist.name }
      artist_list.each do |artist|
        puts "#{counter}. #{artist.name}"
        counter += 1
      end
  end

  def list_genres
    counter = 1

    genre_list = Genre.all.sort_by { |genre| genre.name }
      genre_list.each do |genre|
        puts "#{counter}. #{genre.name}"
        counter += 1
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp

    entered_artist = Artist.find_by_name(user_input)
    if entered_artist
        counter = 1
        entered_artist.songs.sort_by { |song| song.name }.each do |song|
         puts "#{counter}. #{song.name} - #{song.genre.name}"
         counter += 1
         end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp

    entered_genre = Genre.find_by_name(user_input)
    if entered_genre
      counter = 1
      entered_genre.songs.sort_by { |song| song.name}.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
    songs = Song.all.sort_by { |song| song.name }
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i

   if user_input > 0 && user_input < songs.size
     puts "Playing #{songs[user_input - 1].name} by #{songs[user_input - 1].artist.name}"
   end
  end
end
