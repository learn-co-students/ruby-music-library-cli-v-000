class MusicLibraryController
  attr_reader :path

  def initialize(path = './db/mp3s')
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
    input = gets.chomp()
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






until input == "exit"
  input = gets.chomp()
end
  end



  def list_songs
    Song.sort_by_name.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.sort_by_name.each_with_index do |artist, index|
      puts "#{index +1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.sort_by_name.each_with_index do |genre, index|
      puts "#{index +1}. #{genre.name}"
    end
  end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets()
    if artist= Artist.all.detect{ |artist| artist.name == user_input }
      artist.songs.sort_by{ |song| song.name}.each_with_index do |song, index|
        puts "#{index +1}. #{song.name} - #{song.genre.name}"
    end
  end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets()
    if genre = Genre.all.detect{ |genre| genre.name == user_input }
      genre.songs.sort_by{ |song| song.name}.each_with_index do |song, index|
        puts "#{index +1}. #{song.artist.name} - #{song.name}"
    end
  end
end

def play_song
  puts "Which song number would you like to play?"
  user_input = gets.strip.to_i
  if user_input >= 1 && user_input < Song.all.size
    sorted_list = Song.sort_by_name
    puts "Playing #{sorted_list[user_input.to_i - 1].name} by #{sorted_list[user_input.to_i - 1].artist.name}"
  end
end

end
