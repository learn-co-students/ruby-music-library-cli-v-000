class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
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
    action = gets.strip
    if action == 'list songs'
      list_songs
    elsif action == 'list artists'
      list_artists
    elsif action == 'list genres'
      list_genres
    elsif action == 'list artist'
      list_songs_by_artist
    elsif action == 'list genre'
      list_songs_by_genre
    elsif action == 'play song'
      play_song
    elsif action != 'exit'
      call
    end
  end

  def list_songs
    Song.all.sort_by! {|song| song.name }
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by! {|artist| artist.name }
    Artist.all.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort_by! {|genre| genre.name }
    Genre.all.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
      if Artist.find_by_name(artist_name)
      Artist.find_by_name(artist_name).songs.sort_by! {|song| song.name }
      Artist.find_by_name(artist_name).songs.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    if Genre.find_by_name(genre_name)
      Genre.find_by_name(genre_name).songs.sort_by! {|song| song.name }
      Genre.find_by_name(genre_name).songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if song_number > 0 && song_number <= Song.all.length
      Song.all.sort_by! {|song| song.name}
      current_song = Song.all[song_number - 1]
      puts "Playing #{current_song.name} by #{current_song.artist.name}"
    end
  end

end
