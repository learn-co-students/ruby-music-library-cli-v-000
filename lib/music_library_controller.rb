class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def display
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end

  def call
    self.display
    input = gets.chomp
    until input == "exit"
      case input
        when "list songs" then self.list_songs
        when "list artists" then self.list_artists
        when "list genres" then self.list_genres
        when "list artist" then self.list_songs_by_artist
        when "list genre" then self.list_songs_by_genre
        when "play song" then self.play_song
        else puts "Sorry, please select an option."
      end
      self.display
      input = gets.chomp
    end
  end

  def list_songs
    Song.all.sort {|x, y| x.name <=> y.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort {|x, y| x.name <=> y.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort {|x, y| x.name <=> y.name}.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist
      artist.songs.sort {|x, y| x.name <=> y.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre
      genre.songs.sort {|x, y| x.name <=> y.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    song = Song.all.sort {|x, y| x.name <=> y.name}[input - 1]
    puts "Playing #{song.name} by #{song.artist.name}" if input >= 1 && input <= Song.all.length
  end

end
