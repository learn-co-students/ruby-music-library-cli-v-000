require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
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
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    song_array = Song.all.sort! {|x,y| x.name <=> y.name}
    song_array.each.with_index do |song, index|
      song_string = "#{index}. #{ song.artist.name } - #{ song.name } - #{ song.genre.name }"
      puts song_string
    end
  end
    # Song.all.each do |song|
    #   binding.pry
    #   song_array = song.sort_by!{}
    #   song_array.each_with_index do |song, index|
    #   string = "#{index}. #{ song.name } - #{ song.artist.name } - #{ song.genre.name }"
    #   puts string
    #   end


end
