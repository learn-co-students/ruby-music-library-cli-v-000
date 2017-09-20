class MusicLibraryController

  def initialize(path="./db/mp3s")
    music_importer = MusicImporter.new(path).import
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
    controller(input)
  end

  def controller(input)
    case input
    when 'list songs'   then list_songs
    when 'list artists' then list_artists
    when 'list genres'  then list_genres
    when 'list artist'  then list_artist
    when 'list genre'   then list_genre
    when 'play song'    then play_song
  end

  def list_songs

  end


end
