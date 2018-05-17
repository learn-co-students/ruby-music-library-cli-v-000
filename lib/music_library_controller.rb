class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
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
    user = gets.chomp
if user == "list songs"
  list_songs
  user = gets.chomp
elsif user == "list artists"
  list_artists
  user = gets.chomp
elsif user == "list genres"
  list_genres
  user = gets.chomp
elsif user == "list artist"
  list_songs_by_artist
  user = gets.chomp
elsif user == "list genre"
  list_songs_by_genre
  user = gets.chomp
elsif user == "play song"
  play_song
  user = gets.chomp
end
until user == "exit"
user = gets.chomp
end
end

def list_songs
  Song.all.sort_by {|song| song.name}.each_with_index do |song, index|
    puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

def list_artists
  Artist.all.sort_by {|artist| artist.name}.each_with_index do |artist, index|
    puts "#{index + 1}. #{artist.name}"
  end
end

def list_genres
  Genre.all.sort_by {|genre| genre.name}.each_with_index do |genre, index|
    puts "#{index + 1}. #{genre.name}"
  end
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  user = gets.chomp
  artist = Artist.find_by_name(user)
  if artist
    artist.songs.sort_by {|song| song.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  user = gets.chomp
  genre = Genre.find_by_name(user)
  if genre
    genre.songs.sort_by {|song| song.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end
end

def play_song
  puts "Which song number would you like to play?"
  input = gets.chomp.to_i
  songs = Song.all.uniq.sort do |a, b|
    a.name <=> b.name
  end
  if (1..songs.length).include?(input)
    song = songs[input-1]
    puts "Playing #{song.name} by #{song.artist.name}"
  end
end

end
