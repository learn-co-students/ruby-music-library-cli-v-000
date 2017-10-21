class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def list_songs
    Song.all.sort do |a,b|
      a.name<=>b.name
    end.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort! do |a,b|
      a.name<=>b.name
    end.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort! do |a,b|
      a.name<=>b.name
    end.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if (Artist.find_by_name(input))
      artist = Artist.find_by_name(input)
      artist.songs.sort! do |a,b|
        a.name<=>b.name
      end
        artist.songs.each_with_index do |artist, index|
        puts "#{index+1}. #{artist.name} - #{artist.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if (Genre.find_by_name(input))
      genre = Genre.find_by_name(input)
      genre.songs.sort do |a,b|
        a.name<=>b.name
      end
        genre.songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if (1..Song.all.size).include?(input)
      song = Song.all.sort do |a, b|
        a.name <=> b.name
      end[input -1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end


  def call
    user_input = ""
    until user_input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp
    end
  end


end
