class MusicLibraryController
  attr_accessor :path, :importer, :input

  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(path).import
    @input = ""
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
    # until @input == "exit"
    #   @input = gets.strip
    # end

    case @input
    when 'list songs'
      list_songs
    when 'list genres'
      list_genres
    when 'list artist'
      list_songs_by_artist
    when 'list genre'
      list_songs_by_genre
    when 'play_song'
      play_song
    else until @input == "exit"
      @input = gets.strip
    end

    end
  end




  def list_songs
    Song.sort_all_by_name
    Song.all.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.sort_all_by_name
    Artist.all.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    Genre.sort_all_by_name
    Genre.all.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    inp = gets.strip
    result = Artist.find_by_name(inp)
    unless result == nil
      result.songs.sort! {|a, b| a.name <=> b.name}
      result.songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    inp = gets.strip
    result = Genre.find_by_name(inp)
    unless result == nil
      result.songs.sort! {|a, b| a.name <=> b.name}
      result.songs.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    Song.sort_all_by_name
    puts "Which song number would you like to play?"
    inp = gets.strip.to_i
    if inp >= 1 && inp < Song.all.length
      selection = Song.all[inp - 1]
      puts "Playing #{selection.name} by #{selection.artist.name}"
    end
  end



end
