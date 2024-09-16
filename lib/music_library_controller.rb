class MusicLibraryController
  attr_accessor :musicimporter, :path #Read and write importer and the path
  extend Concerns::Findable #access the class methods (find or create in the module)

  def initialize(path = "./db/mp3s") #Default argument for the ending of the file given in path.
   @importer = MusicImporter.new(path).import
   #Create new instance (.new) of the MusicIMporter object (instantated in the MusicLibraryController class). And then you can call that MusicImporter's own class methods on this object (.import)
  end

  def call
    user_input = " " #Set empty string to hold the user's input
    until user_input == "exit" #until the user types "exit" continue these Qs.
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets.chomp.downcase #Chomp off the ending (the return key) and make sure downcase since all of the specs are downcase
    case user_input #Case allows for complicated switch statement ("In the case the user_input is......when X, puts X, etc. etc.etc.")
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

  def list_songs #Nested iteration. Song objects (all) sort by (iterate through) and look at each 'song' var and then make sure to sort-by the song's name (returns this newly sorted alphabetical array)
    #then take that new array and call the each_with_index method on it (starting at 1 bc arrays start at 0 but ppl start counting lists at 1) then pass in the local vars 'song and index' through the iteration each_with_index
    #and this method will return the new array of all of the song instances listed out with their specific index number (starting at 1)
    #=> [#=> {"cat"=>0, "dog"=>1, "wombat"=>2}] last, simply call puts to output that returned array in a string. you are operating on the SONG object so you need so call song.artist.name (cannot simply call artist.name)
    Song.all.sort_by {|song| song.name}.each.with_index(1) do |song, index|
    puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists #Just like the method above, except we only need to print out the index/artist name, not the song and genre with it...
    Artist.all.sort_by {|artist| artist.name}.each.with_index(1) do |artist, index|
    puts "#{index}. #{artist.name}"
    end
  end

  def list_genres #Same as artist method above, just list the index/genre
    Genre.all.sort_by {|genre| genre.name}.each.with_index(1) do |genre, index|
    puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    #Iterate through all artist objects and FIND the one that matches the user-input. This returns the array of all the artist objects that match the artist given by the user. now we need to operate on this array to grab the songs...
    #then reutrn all of the SONGS by that particular artist (songs lised by index starting at one, alphabeticsl) refer to the artist method above. we are going to
    #iterate through to first find the artist and all of his/her songs. Each.with_index allows you to start a (1) instead of just starting a 0.
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    if artist = Artist.find_by_name(user_input)
    artist.songs.sort_by {|song| song.name}.each.with_index(1) {|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
    end
  end


  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    if genre = Genre.find_by_name(user_input)
    genre.songs.sort_by {|song| song.name}.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i
      if (1..Song.all.length).include?(user_input)
      song = Song.all.sort_by(&:name)[user_input - 1]
      end
    puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end
