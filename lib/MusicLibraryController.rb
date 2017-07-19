class MusicLibraryController

  attr_accessor :path, :song

  def initialize(path = "./db/mp3s")
    @path = MusicImporter.new(path) #initialize @path to the path value once sent to and returned by the Importer
    @path.import #invoke import method on MusicImporter object
  end

  def call
    input = ""
    puts "Welcome to your music library!"
    while input != "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
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
    #new array sorted from @@all array in Song class using :name attribute from Song class.
    sorted = Song.all.sort_by {|song| song.name}
    sorted.each_with_index {|song, index| puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted = Artist.all.sort_by {|artist| artist.name}
    sorted.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def list_genres
    sorted = Genre.all.sort_by {|genre| genre.name}
    sorted.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    results = Artist.find_by_name(input) #search using method in Findable Module and store results in 'results' var
    if results != nil
      sorted = results.songs.sort_by {|song| song.name }
      sorted.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    results = Genre.find_by_name(input)
    if results != nil
      sorted = results.songs.sort_by{|song| song.name}
      sorted.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input < Song.all.count && input != nil
      sorted = Song.all.sort_by {|song| song.name}
        puts "Playing #{sorted[input-1].name} by #{sorted[input-1].artist.name}"
    end
  end

end
