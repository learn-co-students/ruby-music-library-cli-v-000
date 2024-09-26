class MusicLibraryController

  attr_accessor :music_importer

  def initialize(path='./db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
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

    input = gets.chomp
    until input == "exit"
      if input == "list songs"
        list_songs
      end
      if input == "list artists"
        list_artists
      end
      if input == "list genres"
        list_genres
      end
      if input == "list artist"
        list_songs_by_artist
      end
      if input == "list genre"
        list_songs_by_genre
      end
      if input == "play song"
        play_song
      end
      input = gets.chomp
    end
  end

  def list_songs
    temp_array = Song.all.sort { |aname, bname| aname.name <=> bname.name }

    temp_array.each_with_index do |val,index|
      puts "#{index+1}. #{val.artist.name} - #{val.name} - #{val.genre.name}"
    end

  end

  def list_artists
    temp_array = Artist.all.sort { |aname, bname| aname.name <=> bname.name }

    temp_array.each_with_index do |val,index|
      puts "#{index+1}. #{val.name}"
    end
  end

  def list_genres
    temp_array = Genre.all.sort { |aname, bname| aname.name <=> bname.name }

    temp_array.each_with_index do |val,index|
      puts "#{index+1}. #{val.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input) != nil
      temp_artist= Artist.find_by_name(input)
      temp_array = temp_artist.songs.sort { |aname, bname| aname.name <=> bname.name }
      temp_array.each_with_index do |val,index|
        puts "#{index+1}. #{val.name} - #{val.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input) != nil
      temp_genre= Genre.find_by_name(input)
      temp_array = temp_genre.songs.sort { |aname, bname| aname.name <=> bname.name }
      temp_array.each_with_index do |val,index|
        puts "#{index+1}. #{val.artist.name} - #{val.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if input > Song.all.size || input < Song.all.size
      temp_array = Song.all.sort { |aname, bname| aname.name <=> bname.name }

      temp_array.each_with_index do |val,index|
        if index+1 == input
          puts "Playing #{val.name} by #{val.artist.name}"
        end
      end
    end
  end

end
