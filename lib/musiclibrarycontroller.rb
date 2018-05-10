class MusicLibraryController
  attr_accessor :importer

  def initialize(path = './db/mp3s')
    self.importer = MusicImporter.new(path)
    self.importer.import

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

    input = gets.chomp
    while input != 'exit'
      puts "What would you like to do?"
      case input
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
      end
      input = gets.chomp
    end
  end

  def list_songs
    songs = Song.all.sort_by{|song| song.name}
    songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    artist_names = Artist.all.map {|artist| artist.name}.sort
    artist_names.each_with_index {|name, index| puts "#{index + 1}. #{name}"}
  end

  def list_genres
    genre_names = Genre.all.map {|genre| genre.name}.sort
    genre_names.each_with_index {|name, index| puts "#{index + 1}. #{name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    artist = Artist.find_by_name(artist)
    if artist
      songs = artist.songs.sort_by {|song| song.name}
      songs.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    genre = Genre.find_by_name(genre)
    if genre
      songs = genre.songs.sort_by {|song| song.name}
      songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    song_list = Song.all.sort_by{|song| song.name}

    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i

    if 1 <= song_number && song_number <= song_list.size
      song = song_list[song_number - 1]
      puts("Playing #{song.name} by #{song.artist.name}")
    end
  end

end
