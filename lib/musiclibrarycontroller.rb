class MusicLibraryController
  attr_accessor :path, :m_import
  def initialize(path = "./db/mp3s")
    # @path = path
    @m_import = MusicImporter.new(path).import
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
      # unless input == exit
      #   "please put a thing in the thing"
      # end
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
  end

  def list_songs
    song_sorted = Song.all.sort do |x, y|
      x.name <=> y.name
    end
    song_sorted.each_with_index do |x, y|
      y += 1
      puts "#{y}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
    end
  end

  def list_artists
    artist_sorted = Artist.all.sort do |x, y|
      x.name <=> y.name
    end
    artist_sorted.each_with_index do |x, y|
      y += 1
      puts "#{y}. #{x.name}"
    end
  end

  def list_genres
    genre_sorted = Genre.all.sort do |x, y|
      x.name <=> y.name
    end
    genre_sorted.each_with_index do |x, y|
      y += 1
      puts "#{y}. #{x.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.find_by_name(artist_name)
    if artist != nil
      artist_sorted = artist.songs.sort do |x, y|
        x.name <=> y.name
      end
      artist_sorted.each_with_index do |x, y|
        y += 1
        puts "#{y}. #{x.name} - #{x.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.find_by_name(genre_name)
    if genre != nil
      genre_sorted = genre.songs.sort do |x, y|
        x.name <=> y.name
      end
      genre_sorted.each_with_index do |x, y|
        y += 1
        puts "#{y}. #{x.artist.name} - #{x.name}"
      end
    end
  end

  def play_song
    Song.all.sort_by!{|s| s.name}
    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i
    if song_number.between?(1, @m_import.count)
      song2 = Song.all[song_number - 1]
      puts "Playing #{song2.name} by #{song2.artist.name}"
    end
  end
end
