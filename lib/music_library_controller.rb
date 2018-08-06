class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
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
      end
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by{|a| a.name}
    sorted_songs.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  def list_artists
    sorted_artists = Artist.all.sort_by{|a| a.name}
    sorted_artists.each_with_index{|artist, index| puts "#{index+1}. #{artist.name}"}
  end
  def list_genres
    sorted_genres = Genre.all.sort_by{|a| a.name}
    sorted_genres.each_with_index{|genre, index| puts "#{index+1}. #{genre.name}"}
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    song_artist = Song.all.select{|song| song.artist.name == user_input}
    sorted_songs = song_artist.sort_by{|a| a.name}
    sorted_songs.each_with_index{|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}

  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    genre_songs = Song.all.select{|song| song.genre.name == user_input}
    sorted_genres = genre_songs.sort_by{|a| a.name}
    sorted_genres.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
  end
  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i
    if user_input > 0 && user_input <= Song.all.length
      song = Song.all.sort{|x,y| x.name <=> y.name}[user_input-1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end
