class MusicLibraryController

  attr_accessor :name

  def initialize(path= './db/mp3s')
    @name = MusicImporter.new(path).import
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

    user_input = gets

    while user_input.chomp != 'exit'
      if user_input == 'list songs'
        self.list_songs
      elsif user_input == 'list artists'
        self.list_artists
      elsif user_input == 'list genres'
        self.list_genres
      elsif user_input == 'list artist'
        self.list_songs_by_artist
      elsif user_input == 'list genre'
        self.list_songs_by_genre
      elsif user_input == 'play song'
        self.play_song
      end
      user_input = gets
    end
  end

  def list_songs
    # Returns array with assorted song instances by name
    assort_songs = Song.all.sort_by { |song| song.name }
    assort_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    assort_artist = Artist.all.sort_by { |artist| artist.name }.uniq { |artist| artist.name }
    assort_artist.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    assort_genre = Genre.all.sort_by { |genre| genre.name }.uniq { |genre| genre.name }
    assort_genre.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets
    counter = 0
    assort_songs = Song.all.sort_by { |song| song.name }
    assort_songs.each do |song|
      if song.artist.name == user_input
        puts "#{counter += 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets
    counter = 0
    assort_songs = Song.all.sort_by { |song| song.name }
    assort_songs.each do |song|
      if song.genre.name == user_input
        puts "#{counter += 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets
    song_num = user_input.to_i
    if song_num.between?(1, Song.all.length)
      song = Song.all.sort_by { |song| song.name }[song_num - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
