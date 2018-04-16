
class MusicLibraryController
  def initialize(path= './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    user = ""
    while user != 'exit'
      puts 'Welcome to your music library!'
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user = gets.chomp
    end
  end

  def list_songs
    Song.all.sort_by(&:name).each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by(&:name).each_with_index do |art, index|
      puts "#{index+1}. #{art.name}"
    end
  end

  def list_genres
    Genre.all.sort_by(&:name).each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user = gets.chomp
    if artist = Artist.find_by_name(user)
      artist.songs.sort_by(&:name).each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end

  def list_songs_by_genre
    user = gets.chomp
    if genre = Genre.find_by_name(user)
      genre.songs.sort_by(&:name).each_with_index do |song, index|
        puts "#{index+1}. #{song.genre.name} - #{song.name} - #{song.artist.name}"
    end
  end
end

  def play_song
    puts "Which song number would you like to play?"
  end

end
