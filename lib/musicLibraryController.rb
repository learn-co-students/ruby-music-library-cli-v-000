class MusicLibraryController

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

    input = nil
    until input == "exit"
    puts "What would you like to do?"
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
    array = Song.all.sort_by(&:name)
    array.each.with_index(1) { |a, i| puts "#{i}. #{a.artist.name} - #{a.name} - #{a.genre.name}" }
  end

  def list_artists
    array = Artist.all.sort_by(&:name)
    array.each.with_index(1) { |a, i| puts "#{i}. #{a.name}"}
  end

  def list_genres
    array = Genre.all.sort_by(&:name)
    array.each.with_index(1) { |g, i| puts "#{i}. #{g.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist
    a = artist.songs.sort_by(&:name)
    a.each.with_index(1) {|song, i| puts "#{i}. #{song.name} - #{song.genre.name}" }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre
      g = genre.songs.sort_by(&:name)
      g.each.with_index(1) {|song, i| puts "#{i}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    array = Song.all.sort_by(&:name)
    input = gets.chomp.to_i
    if input.between?(1,array.length)
      puts "Playing #{array[input-1].name} by #{array[input-1].artist.name}"
    end
  end

end
