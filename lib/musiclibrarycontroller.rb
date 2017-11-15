class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def list_songs
    sorted_songs = Song.all.sort_by{|s| s.name}
    sorted_songs.each_with_index do |s, i|
      puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort_by{|a| a.name}
    sorted_artists.each_with_index do |a, i|
      puts "#{i + 1}. #{a.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort_by{|g| g.name}
    sorted_genres.each_with_index do |g, i|
      puts "#{i + 1}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    response = gets.strip
    a = Artist.find_by_name(response)
    if a
      songs = a.songs.sort_by{ |s| s.name }
      songs.each_with_index { |s, i| puts "#{i+1}. #{s.name} - #{s.genre.name}" }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    response = gets.strip
    g = Genre.find_by_name(response)
    if g
      songs = g.songs.sort_by{ |s| s.name }
      songs.each_with_index { |s, i| puts "#{i+1}. #{s.artist.name} - #{s.name}" }
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    response = gets.strip
    res = response.to_i
    sorted = Song.all.sort_by{|s| s.name}.collect{ |x| [x.name, x.artist] }
    if res < sorted.length && res > 0
      play = sorted[res - 1]
      puts "Playing #{play[0]} by #{play[1].name}"
    end
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts"To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    response = gets.strip

    if response == "list songs"
      list_songs
    elsif response == "list artists"
      list_artists
    elsif response == "list genres"
      list_genres
    elsif response == "list artist"
      list_songs_by_artist
    elsif response == "list genre"
      list_songs_by_genre
    elsif response == "play song"
      play_song
    elsif response == "exit"
      #nothing
    else
      call
    end
  end
end
