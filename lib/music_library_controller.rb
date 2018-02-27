class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    self.path = path
    importer = MusicImporter.new(path)
    importer.import
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
    loop do
      puts "What would you like to do?"
      user_input = gets.chomp
      case user_input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      when 'exit'
        break
      end
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name}
    sorted_genres.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    songs_by_artist = Song.all.select {|song| song.artist.name == user_input}
    sorted_songs_by_artist = songs_by_artist.sort_by {|song| song.name}
    sorted_songs_by_artist.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    songs_by_genre = Song.all.select {|song| song.genre.name == user_input}
    sorted_songs_by_genre = songs_by_genre.sort_by {|song| song.name}
    sorted_songs_by_genre.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    sorted_songs = Song.all.sort_by {|song| song.name}
    puts "Which song number would you like to play?"
    user_input = gets.chomp
    if user_input.to_i <= sorted_songs.length && user_input.to_i > 0
      song = sorted_songs[user_input.to_i-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
