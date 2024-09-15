class MusicLibraryController
  def initialize(path = "./db/mp3s")
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
    user_input = gets.chomp
    while user_input != 'exit'
      self.list_songs if user_input == 'list songs'
      self.list_artists if user_input == 'list artists'
      self.list_genres if user_input == 'list genres'
      self.list_songs_by_artist if user_input == 'list artist'
      self.list_songs_by_genre if user_input == 'list genre'
      if user_input == 'play song'
        self.list_songs
        self.play_song
      end
      user_input = gets.chomp
    end
  end

  def list_songs
    Song.all.sort_by{ |song| song.name }.each.with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{ |artist| artist.name }.each.with_index do |artist, index|
      puts "#{index +1 }. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{ |genre| genre.name }.each.with_index do |genre, index|
      puts "#{index +1 }. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_artist = gets.chomp

    if Artist.all.any?{ |artist| artist.name == user_artist }
      Artist.all.detect{ |artist| artist.name == user_artist }.songs.sort_by{ |song| song.name }.each.with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_genre = gets.chomp

    if Genre.all.any?{ |genre| genre.name == user_genre }
      Genre.all.detect{ |genre| genre.name == user_genre }.songs.sort_by{ |song| song.name }.each.with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_selection = gets.chomp.to_i
    song = Song.all.sort_by{ |song| song.name }[user_selection - 1]
    if (song.instance_of? Song) && (user_selection >= 1) && (user_selection <= Song.all.size)
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
