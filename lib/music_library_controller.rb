#musiclibrarycontroller class
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_a = MusicImporter.new(path)
    new_a.import

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

    input = nil
    until input == "exit"
      input = gets.strip
    end
  end

  def list_songs
    Song.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    artist_array = Song.all.sort{|a,b| a.artist.name <=> b.artist.name}.map {|s| s.artist.name}
    artist_array.uniq.each.with_index(1) do |a, i|
      puts "#{i}. #{a}"
    end
  end

  def list_genres
    Song.all.sort{|a,b| a.genre.name <=> b.genre.name}.each.with_index(1) do |s, i|
      puts "#{i}. #{s.genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.all.detect {|a| a.name == input}
    if artist != nil
      artist.songs.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |s,i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

end
