class MusicLibraryController
  attr_accessor :sorted_songs

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

    input = gets.strip.to_s

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

    call unless input == "exit"
  end

  def list_songs
    @sorted_songs = Song.all.sort_by{|song| song.name}
    sorted_songs.each.with_index(1) {|song, i| puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each.with_index(1){|artist, i| puts "#{i}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each.with_index(1){|genre, i| puts "#{i}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets.strip)
    artist.songs.sort_by{|song| song.name}.each.with_index(1){|song, i| puts "#{i}. #{song.name} - #{song.genre.name}"} if artist
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets.strip)
    genre.songs.sort_by{|song| song.name}.each.with_index(1){|song, i| puts "#{i}. #{song.artist.name} - #{song.name}"} if genre
  end

  def play_song
    puts "Which song number would you like to play?"
    @sorted_songs = Song.all.sort_by{|song| song.name} unless sorted_songs
    input = gets.strip.to_i
    puts "Playing #{sorted_songs[input-1].name} by #{sorted_songs[input-1].artist.name}" if input.between?(1, sorted_songs.length)
  end
end
