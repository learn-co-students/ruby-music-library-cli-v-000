class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    musicimporter = MusicImporter.new(@path)
    musicimporter.import
  end

  def call
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")

    command = ""
    until command == "exit"
      command = gets.chomp
      case command
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
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

  def list_songs(no_msg=false)
    song_list = Song.all.sort_by {|song| song.name}
    song_list.each do |song|
      #"1. Thundercat - For Love I Come - dance"
      puts "#{song_list.index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" if no_msg == false
    end
    song_list
  end

  def list_artists
    artist_list = Artist.all.sort_by {|artist| artist.name}
    artist_list.each do |artist|
      # "1. Action Bronson"
      puts "#{artist_list.index(artist)+1}. #{artist.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.sort_by {|genre| genre.name}
    genre_list.each do |genre|
      # "1. country"
      puts "#{genre_list.index(genre)+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    artist_selected = Artist.all.find {|artist| artist.name == artist_name}

    if artist_selected
      song_list = artist_selected.songs.sort_by {|song| song.name}
      song_list.each do |song|
        # "1. Green Aisles - country"
        puts "#{song_list.index(song)+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    genre_selected = Genre.all.find {|genre| genre.name == genre_name}

    if genre_selected
      song_list = genre_selected.songs.sort_by {|song| song.name}
      song_list.each do |song|
        # "1. Real Estate - It's Real"
        puts "#{song_list.index(song)+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.chomp

    if song_number.to_i > 0
      song_number = song_number.to_i - 1
      song_list = list_songs(true)
      song_selected = song_list[song_number]

      if song_selected
        # "Playing Larry Csonka by Action Bronson"
        puts "Playing #{song_selected.name} by #{song_selected.artist.name}"
      end
    end
  end

end
