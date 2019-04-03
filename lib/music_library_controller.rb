

class MusicLibraryController

  def initialize(path = nil)

    if path == nil
      path = "./db/mp3s"
    end

    importer_object = MusicImporter.new(path)
    importer_object.import

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
   4.times { user_response = gets.strip unless user_response == "exit" }

  end

  def list_songs
    all_songs = Song.all
    all_songs.sort! { |a, b| a.name <=> b.name }

    counter = 0
    all_songs.each do |each_song|
      counter += 1
      puts "#{counter}. #{each_song.artist.name} - #{each_song.name} - #{each_song.genre.name}"
    end
  end

  def list_artists
    all_artists = Artist.all
    all_artists.sort! { |a, b| a.name <=> b.name }

    counter = 0
    all_artists.each do |each_artist|
      counter += 1
      puts "#{counter}. #{each_artist.name}"
    end
  end



end
