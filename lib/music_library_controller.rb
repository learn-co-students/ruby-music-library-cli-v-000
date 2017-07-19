class MusicLibraryController

  def initialize(path = "./db/mp3s")
    # IOT save an Artist instance, you must fire <<Artist.create>>
    x = MusicImporter.new(path)
    x.import
    # accepts one argument, the path to the MP3 files to be imported (FAILED - 1)
    # creates a new MusicImporter object, passing in the 'path' value (FAILED - 2)
    # the 'path' argument defaults to './db/mp3s' (FAILED - 3)
    # invokes the #import method on the created MusicImporter object (FAILED - 4)
  end

  def call
    def intro_text
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
    intro_text
    user_input = gets.strip
    valid_options = ["exit", "list songs", "list artists", "list genres", "list artist", "list genre", "play song"]
    until valid_options.include? user_input
      puts "that's not a valid option dumbass!"
      intro_text
      user_input = gets.strip
    end

    case user_input
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

  def goodbye_message
    puts "Thank you for using Music Library!"
  end

  def list_songs
    Song.all.sort {|a, b| a.name <=> b.name}.each_with_index do |song, number|
      puts "#{number+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort {|a, b| a.name <=> b.name}.each_with_index do |artist, number|
      puts "#{number+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort {|a, b| a.name <=> b.name}.each_with_index do |genre, number|
      puts "#{number+1}. #{genre.name}"
    end
  end

# OK so here I figured out an alternative to the GitHub answer; it involves
# creating an empty array << artist_songs >> rather than using the
# << find_by_name >> method defined in << Concerns::Findable >>
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_songs = []
    user_input = gets.strip
    Song.all.collect do |x|
      if x.artist.name == user_input
        artist_songs << x
      end
    end

    artist_songs.sort{|a, b| a.name <=> b.name}.each_with_index do |value, index|
      puts "#{index+1}. #{value.name} - #{value.genre.name}"
    end
  end

# Here I make use of the << find_by_name >> method defined in << Concerns::Findable >>
def list_songs_by_genre
  puts "Please enter the name of a genre:"
  input = gets.strip

  if genre = Genre.find_by_name(input)
    genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name}"
    end
  end
end

def play_song
  puts "Which song number would you like to play?"

  input = gets.strip.to_i
  if (1..Song.all.length).include?(input)
    song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
  end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end
