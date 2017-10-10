class MusicLibraryController

  attr_reader :path

  def initialize(path = "./db/mp3s")
    file = MusicImporter.new(path)
    file.import
  end

  def call
    input = nil
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
      input = gets.chomp

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
    sorted = Song.all.uniq.sort {|a, b| a.name <=> b.name}
    sorted.each.with_index(1) {|e, i| puts "#{i}. #{e.artist.name} - #{e.name} - #{e.genre.name}"}
  end

  def list_songs_title_genre
    sorted = Song.all.uniq.sort {|a, b| a.name <=> b.name}
    sorted.each.with_index(0) {|e, i| puts "#{i}. #{e.name} - #{e.genre.name}"}
  end

  def list_artists
    sorted = Artist.all.uniq.sort {|a, b| a.name <=> b.name}
    sorted.each.with_index(1) {|e, i| puts "#{i}. #{e.name}"}
  end

  def list_genres
    sorted = Genre.all.uniq.sort {|a, b| a.name <=> b.name}
    sorted.each.with_index(1) {|e, i| puts "#{i}. #{e.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input)
      artist = Artist.find_by_name(input)
      artist.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) {|e, i| puts "#{i}. #{e.name} - #{e.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input)
      genre = Genre.find_by_name(input)
      genre.songs.sort{|a, b| a.name <=> b.name}.each.with_index(1) {|e, i| puts "#{i}. #{e.artist.name} - #{e.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    sorted = Song.all.uniq.sort{|a,b| a.name <=> b.name}
    if sorted.include?(sorted[input]) && input <= sorted.count && input > 0
      puts "Playing #{sorted[input-1].name} by #{sorted[input-1].artist.name}"
    end
  end


end
