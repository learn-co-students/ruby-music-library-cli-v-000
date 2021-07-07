require 'pry'
class MusicLibraryController

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  # Instance Method(s)
  def call
    user_selection = nil
    while user_selection != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_selection = gets.strip
      case user_selection
      when 'list songs' then list_songs
      when 'list artists' then list_artists
      when 'list genres' then list_genres
      when 'list artist' then list_songs_by_artist
      when 'list genre' then list_songs_by_genre
      when 'play song' then play_song
      end
    end
  end

  # CLI Methods
  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}.uniq
    sorted_artists.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name}.uniq
    sorted_genres.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_req = gets.chomp
    result = Artist.find_by_name(artist_req)
    if result
      sorted = result.songs.sort_by {|song| song.name}
      sorted.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_req = gets.chomp
    result = Genre.find_by_name(genre_req)
    if result
      sorted = result.songs.sort_by {|song| song.name}
      sorted.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    selected_song_number = gets.chomp.to_i
    sorted = Song.all.sort_by {|song| song.name}
    sorted.each.with_index(1) do |song, song_number|
      if song_number == selected_song_number
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end
