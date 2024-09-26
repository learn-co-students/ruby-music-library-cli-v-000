class MusicLibraryController

  def initialize(path='./db/mp3s')
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
    input = gets
    if input == 'list songs'
      list_songs
    elsif input == 'list artists'
      list_artists
    elsif input == 'list genres'
      list_genres
    elsif input == 'list artist'
      list_songs_by_artist
    elsif input == 'list genre'
      list_songs_by_genre
    elsif input == 'play song'
      play_song
    end

    until gets == 'exit'

    end

  end

  def list_songs
    Song.all.sort{|x,y| x.name <=> y.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{|x,y| x.name <=> y.name}.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort{|x,y| x.name <=> y.name}.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input)
      list = Artist.find_by_name(input).songs.sort_by{|song| song.name}
      list.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input)
      list = Genre.find_by_name(input).songs.sort_by{|song| song.name}
      list.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i - 1
    list = Song.all.sort{|x,y| x.name <=> y.name}
    song = list[input]
    puts "Playing #{song.name} by #{song.artist.name}" if input.between?(0, Song.all.length - 1)
  end








end
