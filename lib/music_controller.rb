class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
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

    input = gets.strip
    
      list_songs if input == "list songs"
      list_artists if input == "list artists"
      list_genres if input == "list genres"
      list_songs_by_artist if input == "list artist"
      list_songs_by_genre if input == "list genre"
      play_song if input == "play song"
      call unless input == "exit"
  end

  def list_songs
    sorted_songs = Song.all.uniq.sort {|a, b| a.name <=> b.name}
    sorted_songs.each_with_index do |s, i|
      puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    sorted_songs = Artist.all.uniq.sort {|a, b| a.name <=> b.name}
    sorted_songs.each_with_index do |s, i|
      puts "#{i + 1}. #{s.name}"
    end
  end

  def list_genres
    sorted_songs = Genre.all.uniq.sort {|a, b| a.name <=> b.name}
    sorted_songs.each_with_index do |s, i|
      puts "#{i + 1}. #{s.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort { |a, b| a.name <=> b.name}.each_with_index do |s, i|
        puts "#{i + 1}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort { |a, b| a.name <=> b.name}.each_with_index do |s, i|
        puts "#{i + 1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    # list_songs
    input = gets.strip.to_i
    song_count = sort_songs.length
    puts "Playing #{sort_songs[input - 1]}" unless
      input > song_count || input <= 0
  end

  def sort_songs
    Song.all.uniq.sort {|a, b|
      a.name <=> b.name}.collect do |s|
        "#{s.name} by #{s.artist.name}"
      end
  end

end
