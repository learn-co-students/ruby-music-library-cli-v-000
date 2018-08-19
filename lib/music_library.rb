class MusicLibraryController

  def initialize(filepath = './db/mp3s')
    importer = MusicImporter.new(filepath)
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
    input = gets.strip
    possible = ["list songs", "list artists", "list genres", "list artist", "list genre", "play song"]
    if possible.include?(input)
      input = input.split(" ")
      self.send("#{input[0]}_#{input[1]}")
    elsif input != "exit"
      call
    end
  end

  def list_songs
    songs = Song.all.sort {|x, y| x.name <=> y.name}
    songs.each_with_index do |val, index|
      puts "#{index + 1}. #{val.artist.name} - #{val.name} - #{val.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort {|x, y| x.name <=> y.name}
    artists.each_with_index do |val, index|
      puts "#{index + 1}. #{val.name}"
    end
  end

  def list_genres
    genres = Genre.all.sort {|x, y| x.name <=> y.name}
    genres.each_with_index do |val, index|
      puts "#{index + 1}. #{val.name}"
    end
  end

  def list_artist
    list_songs_by_artist
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input)
      artist = Artist.find_by_name(input)
      songs = artist.songs.sort {|x,y| x.name <=> y.name}
      songs.each_with_index do |val, index|
        puts "#{index + 1}. #{val.name} - #{val.genre.name}"
      end
    end
  end

  def list_genre
    list_songs_by_genre
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input)
      genre = Genre.find_by_name(input)
      songs = genre.songs.sort {|x,y| x.name <=> y.name}
      songs.each_with_index do |val, index|
        puts "#{index + 1}. #{val.artist.name} - #{val.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = (gets.strip.to_i) - 1
    if input > 0 && input < Song.all.count
      songs = Song.all.sort {|x, y| x.name <=> y.name}
      song = songs[input]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
