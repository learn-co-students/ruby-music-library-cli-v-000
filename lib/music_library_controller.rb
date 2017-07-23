class MusicLibraryController
  attr_accessor :song

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
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

    input = ""

    while input != "exit"
        input = gets.strip
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
    alphabetized = Song.all.sort_by do |song|
      song.name
    end
    list = alphabetized.collect do | song |
        "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    list.each_with_index { |string, index | puts "#{index+1}. #{string}" }
  end

  def list_artists
    list = Artist.all.collect do | artist |
        artist.name
      end
    list.sort.uniq.each_with_index { |string, index | puts "#{index+1}. #{string}" }
  end

  def list_genres
    list = Genre.all.collect do | genre |
        genre.name
      end
    list.sort.uniq.each_with_index { |string, index | puts "#{index+1}. #{string}" }
  end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    list = Song.all.sort_by do | song |
        song.name
      end
      artists = list.find_all { |song| song.artist.name == input }
      artists.uniq.each_with_index do | song, index |
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    list = Song.all.sort_by do | song |
        song.name
      end
      genres = list.find_all { |song| song.genre.name == input }
      genres.uniq.each_with_index do | song, index |
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    song_number = input.to_i - 1
    alphabetized = Song.all.sort_by do |song|
      song.name
    end
    selection = alphabetized[song_number]
    if selection == nil
    elsif song_number < 1 || song_number >= alphabetized.length
    else
      puts "Playing #{selection.name} by #{selection.artist.name}"
    end
  end


end
