require 'pry'

class MusicLibraryController

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
    input = gets.strip

    if input.include?('list songs')
      list_songs
    elsif input.include?('list artists')
      list_artists
    elsif input.include?('list genres')
      list_genres
    elsif input.include?('list artist')
      list_songs_by_artist
    elsif input.include?('list genre')
      list_songs_by_genre
    elsif input.include?('play song')
      play_song
    elsif input.include?('exit')
      return nil
    else
      call
    end
  end

  def list_songs
    my_songs = Song.all.sort_by {|song| song.name}

    my_songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    my_artists = Artist.all.sort_by {|artist| artist.name}

    my_artists.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    my_genres = Genre.all.sort_by {|genre| genre.name}

    my_genres.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    songs = Song.all.select {|s| s.artist.name.include?(input)}
    sorted_songs = songs.sort_by {|song| song.name}

    sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    songs = Song.all.select {|s| s.genre.name.include?(input)}
    sorted_songs = songs.sort_by {|song| song.name}

    sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i

    my_songs = Song.all.sort_by {|song| song.name}

    if (1..my_songs.length).include?(input)
      song = my_songs[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
