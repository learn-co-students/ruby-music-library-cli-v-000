class MusicLibraryController

  def initialize(path = "./db/mp3s")
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

    input = gets.chomp

    if input == 'list songs'
      list_songs
      call
    elsif input == 'list artists'
      list_artists
      call
    elsif input == 'list genres'
      list_genres
      call
    elsif input == 'list artist'
      list_songs_by_artist
      call
    elsif input == 'list genre'
      list_songs_by_genre
      call
    elsif input == 'play song'
      play_song
      call
    elsif input == 'exit'
      return
    else
      call
    end
  end

  def list_songs
    counter = 1
    alphabetized_songs = Song.all.sort_by { |song| song.name }
    alphabetized_songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    alphabetized_by_artist = Artist.all.sort_by { |artist| artist.name }
    alphabetized_by_artist.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    alphabetized_by_genre = Genre.all.sort_by { |genre| genre.name }
    alphabetized_by_genre.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    selection = Artist.find_by_name(input)
    if selection
      counter = 1
      selection.songs.sort_by { |song| song.name }.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    selection = Genre.find_by_name(input)
    if selection
      counter = 1
      selection.songs.sort_by { |song| song.name }.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end

  def play_song
    songs = Song.all.sort_by { |song| song.name }
    puts "Which song number would you like to play?"
    number = gets.chomp.to_i

    if number > 0 && number < songs.size
      puts "Playing #{songs[number-1].name} by #{songs[number-1].artist.name}"
    end
  end
end
