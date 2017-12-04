class MusicLibraryController
  attr_accessor :path


  def initialize(path="./db/mp3s")
    @path = path
    aMusicImporter = MusicImporter.new(path).import


  end

  def list_songs

    sorted = Song.all.sort_by {|obj| obj.name}

    sorted.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"

    end

  end

  def list_artists

    sorted = Artist.all.sort_by {|obj| obj.name}
    sorted.each_with_index do |artist, index|
    puts "#{index + 1}. #{artist.name}"


    end

  end
  def list_genres

    sorted = Genre.all.sort_by {|obj| obj.name}
    sorted.each_with_index do |genre, index|
    puts "#{index + 1}. #{genre.name}"
    end

    end

  def call
    greetings
    input = gets.strip
    until input == "exit"
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "play song"
        play_song
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre

      else
        puts "What would you like to do?"


      end
      input = gets.strip
    end

  end

  def greetings
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

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)

      sorted = artist.songs.sort_by {|obj| obj.name}
      sorted.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"

      end

    end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  input = gets.strip
  if genre = Genre.find_by_name(input)

    sorted = genre.songs.sort_by {|obj| obj.name}
    sorted.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
  end
  end
end

def play_song
  puts "Which song number would you like to play?"
  input = gets.strip

  sorted = Song.all.sort_by {|obj| obj.name}

   song = sorted[input.to_i - 1]

   if song != nil && input.to_i.between?(1, Song.all.length)

    puts "Playing #{song.name} by #{song.artist.name}"


end
end
end
