
class MusicLibraryController

  attr_accessor :song_library, :artist_library, :genre_library

  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
    @song_library = Song.all
    @artist_library = Artist.all
    @genre_library = Genre.all
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
      case input

      when 'exit'
        quit
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

      puts "What would you like to do?"
      input = gets.chomp

    end

  end

  def list_songs
    # binding.pry
    ordered_songs = self.song_library.sort { |song_a, song_b| song_a.name <=> song_b.name }

    ordered_songs.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"  }
    ordered_songs
  end

  def list_artists
    ordered_artists = self.artist_library.sort { |artist_a, artist_b| artist_a.name <=> artist_b.name}
    artists_names = ordered_artists.map { |artist| artist.name }
    ordered_uniq_artists_names = artists_names.uniq
    # binding.pry
    ordered_uniq_artists_names.each_with_index { |artists_name, index| puts "#{index + 1}. #{artists_name}"}
  end

  def list_genres
    ordered_genre_objects = self.genre_library.sort { |genre_a, genre_b| genre_a.name <=> genre_b.name}
    ordered_genre_names = ordered_genre_objects.map { |genre| genre.name }
    ordered_uniq_genre_names = ordered_genre_names.uniq

    ordered_uniq_genre_names.each_with_index { |genre_name, index| puts "#{index + 1}. #{genre_name}"}

  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp

    selected_artist = self.artist_library.detect { |artist| artist.name == input  }
    # binding.pry
    unless selected_artist == nil
      sorted_songs = selected_artist.songs.sort { |song_a, song_b| song_a.name <=> song_b.name }
      sorted_songs.each_with_index { |song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}" }
    end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp

    selected_genre = self.genre_library.detect { |genre| genre.name == input  }
    # binding.pry
    unless selected_genre == nil
      sorted_songs = selected_genre.songs.sort { |song_a, song_b| song_a.name <=> song_b.name }
      sorted_songs.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}" }
    end
  end

  def play_song
    # ordered_songs = list_songs

    puts "Which song number would you like to play?"

    input = gets.chomp

    ordered_songs = Song.all.sort { |song_a, song_b| song_a.name <=> song_b.name }

    if input.to_i > 0 && input.to_i <= Song.all.count
      puts "Playing #{ordered_songs[input.to_i - 1].name} by #{ordered_songs[input.to_i - 1].artist.name}"
    end
  end



end
