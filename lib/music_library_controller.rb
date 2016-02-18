class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library! What would you like to do?" 
    self.menu
    input = gets.strip
    until input == "exit" do
      do_a_thing(input)
      puts "What would you like to do next? Please enter a command:"
      input = gets.strip
    end
    puts "Goodbye!"
  end

  def do_a_thing(input)
    case input
      when "list songs"
        Song.list_songs
      when "list artists"
        Artist.list_artists
      when "list genres"
        Genre.list_genres
      when "play song"
        puts "Please enter the song number:"
        number = gets.strip
        Song.play_song(number)
      when "list artist"
        puts "Please enter the artist name:"
        artist_name = gets.strip
        Artist.list_songs(artist_name)
      when "list genre"
        puts "Please enter the genre name:"
        genre_name = gets.strip
        Genre.list_songs(genre_name)
      else
        puts "Invalid command. Please try again!"
    end
  end

  def menu
    puts "To list all your songs: type 'list songs'" 
    puts "To list all your artists: type 'list artists'" 
    puts "To list all your genres: type 'list genres'" 
    puts "To play a song: type 'play song'"
    puts "To list all songs by an artist: type 'list artist'"
    puts "To list all songs in a genre: type 'list genre'"
    puts "To exit: type 'exit'"
  end

end