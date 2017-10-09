class MusicLibraryController

  attr_reader :path

  def initialize(path = './db/mp3s')
    @path = path
    path_import = MusicImporter.new(path)
    path_import.import
  end

def call
    puts "Welcome to your music library!"
    user_input = ""

    until user_input == "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

    user_input = gets.strip
    
case user_input
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
  sorted_songs = Song.all.sort_by { |song| song.name }
  index = 0
  sorted_songs.each { |song| puts "#{index += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
end

def list_artists
  sorted_artists = Artist.all.sort_by { |artist| artist.name }
  index = 0
  sorted_artists.each { |artist| puts "#{index += 1}. #{artist.name}"}
end

def list_genres
  sorted_genres = Genre.all.sort_by { |genre| genre.name }
  index = 0
  sorted_genres.each { |genre| puts "#{index += 1}. #{genre.name}"}
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  user_input = gets.strip
#user is asked to provide artist name, is artist exists => print all songs by artist
  if Artist.find_by_name(user_input)
    artist = Artist.find_by_name(user_input)
    all_songs = artist.songs.sort{ |a, b| a.name <=> b.name}
    all_songs.each_with_index do |song, index|
      puts "#{index += 1}. #{song.name} - #{song.genre.name}"
    end
  end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  user_input = gets.strip
  if Genre.find_by_name(user_input)
    genre = Genre.find_by_name(user_input)
    all_songs = genre.songs.sort{ |a, b| a.name <=> b.name}
    all_songs.each_with_index do |song, index|
      puts "#{index += 1}. #{song.artist.name} - #{song.name}"
    end
  end
end

  def play_song
    puts "Which song number would you like to play?"
    song_list = Song.all.sort_by { |song| song.name}
    user_input = gets.strip
    #check user input is between 1-length of list_songs_by_artist
    if user_input.to_i <= song_list.length && user_input.to_i > 0
      puts "Playing #{song_list[user_input.to_i-1].name} by #{song_list[user_input.to_i-1].artist.name}"
    end
  end
end
