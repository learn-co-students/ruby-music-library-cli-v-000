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
    input = nil
    until input == "exit"
      input = gets.chomp
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
  end

  def list_songs
    list = Song.all.sort_by(&:name)
    list.each.with_index(1) {|x, y| puts "#{y}. #{x.artist.name} - #{x.name} - #{x.genre.name}"}
  end

  def list_artists
    list = Artist.all.sort_by(&:name)
    list.each.with_index(1) {|x, y| puts "#{y}. #{x.name}"}
  end

  def list_genres
    list = Genre.all.sort_by(&:name)
    list.each.with_index(1) {|x, y| puts "#{y}. #{x.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    name_of_artist = Artist.find_by_name(input)
    if name_of_artist
      x = name_of_artist.songs.sort_by(&:name)
      x.each.with_index(1) {|song, i| puts "#{i}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    name_of_genre = Genre.find_by_name(input)
    if name_of_genre
      x = name_of_genre.songs.sort_by(&:name)
      x.each.with_index(1) {|song, i| puts "#{i}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = Song.all.sort_by(&:name)
    input = gets.chomp.to_i
    puts "Playing #{song_number[input-1].name} by #{song_number[input-1].artist.name}" if input.between?(1,song_number.length)
  end


end
