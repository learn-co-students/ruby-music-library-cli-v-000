require "pry"
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    user = ""
    while user != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user = gets.strip
    end
  end

  def list_songs
    Song.all.sort_by(&:name).each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
  end
end

  def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
  end
end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user = gets.strip

    if artist = Artist.find_by_name(user)

      artist.songs.sort_by(&:name).each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
    end
  end
end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user = gets.strip

    if genre = Genre.find_by_name(user)
      genre.songs.sort_by(&:name).each.with_index(1) do |genre, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
    end
  end
end

  def play_song
    puts "Which song number would you like to play?"
    user = gets.strip.to_i
    if (1..Song.all.length).include?(user)
      song = Song.all.sort_by(&:name)[user - 1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end
