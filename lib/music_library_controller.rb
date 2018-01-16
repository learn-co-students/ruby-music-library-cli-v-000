class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    imported = MusicImporter.new(path)
    imported.import
  end

  def call
    input = nil
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    until input == "exit"
      puts "What would you like to do?"
      input = gets.chomp
      if input == "list songs"
        list_songs
      elsif input == "list genres"
        list_genres
      elsif input == "list artists"
        list_artists
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def list_songs
    counter = 1
    Song.all.sort! { |a, b| a.name.downcase <=> b.name.downcase }
    Song.all.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    Artist.all.sort! { |a, b| a.name.downcase <=> b.name.downcase }
    Artist.all.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    Genre.all.sort! { |a, b| a.name.downcase <=> b.name.downcase }
    Genre.all.each do |genres|
      puts "#{counter}. #{genres.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    unless artist == nil
      counter = 1
      artist.songs.sort! { |a, b| a.name.downcase <=> b.name.downcase }
      artist.songs.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    unless genre == nil
      counter = 1
      genre.songs.sort! { |a, b| a.name.downcase <=> b.name.downcase }
      genre.songs.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    sorted_songs = sort_songs
    input = gets.chomp.to_i
    if input.class == Fixnum && input.between?(1, sorted_songs.count)
      puts "Playing #{sorted_songs[input].name} by #{sorted_songs[input].artist.name}"
    end
  end

  def sort_songs
    Song.all.each do |song|
    end
  end
end   
