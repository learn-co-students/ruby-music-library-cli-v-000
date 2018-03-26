class MusicLibraryController
  def initialize(path=nil)
    MusicImporter.new(path || './db/mp3s').import
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
    user_input = ''
    while user_input != 'exit'
      user_input = gets

      case user_input
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

    end
  end

  def list_songs
    Song.all.each_with_index do |o, i|
      puts "#{i+1}. #{o.artist.name} - #{o.name} - #{o.genre.name}"
    end
  end

  def list_artists
    Artist.all.each_with_index do |o, i|
      puts "#{i+1}. #{o.name}"
    end
  end

  def list_genres
    Genre.all.each_with_index do |o, i|
      puts "#{i+1}. #{o.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    if result = Artist.find_by_name(gets)
      result.songs.each_with_index do |o, i|
        puts "#{i+1}. #{o.name} - #{o.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    if result = Genre.find_by_name(gets)
      result.songs.each_with_index do |o, i|
        puts "#{i+1}. #{o.artist.name} - #{o.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.to_i-1
    if user_input >= 1 && song = Song.all[user_input]
      puts "Playing #{song.name} by #{song.artist.name}"
    else
      "Which song number would you like to play?"
    end
  end
















end
