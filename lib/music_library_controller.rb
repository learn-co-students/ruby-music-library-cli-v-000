class MusicLibraryController

  def initialize(path = './db/mp3s')
    @importer = MusicImporter.new(path)
    @importer.import
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
    if input == "list songs"
      list_songs
    elsif input == "list artists"
      list_artists
    elsif input == "list genres"
      list_genres
    elsif input == "list artist"
      list_songs_by_artist
    elsif input == "list genre"
      list_songs_by_genre
    elsif input == "play song"
      play_song
    end
    call if input != "exit"
  end

  def list_songs
    count = 1
    Song.all.sort_by {|x| x.name}.each do |f|
      puts "#{count}. #{f.artist.name} - #{f.name} - #{f.genre.name}"
      count += 1
    end
  end

  def list_artists
    count = 1
    Artist.all.sort_by {|x| x.name}.each do |f|
      puts "#{count}. #{f.name}"
      count += 1
    end
  end

  def list_genres
    count = 1
    Genre.all.sort_by {|x| x.name}.each do |f|
      puts "#{count}. #{f.name}"
      count += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    count = 1
    Song.all.select {|s| s.artist.name == input}.sort_by {|x| x.name}.each do |f|
      puts "#{count}. #{f.name} - #{f.genre.name}"
      count += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    count = 1
    Song.all.select {|s| s.genre.name == input}.sort_by {|x| x.name}.each do |f|
      puts "#{count}. #{f.artist.name} - #{f.name}"
      count += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input.between?(1, Song.all.count)
      song = Song.all.sort_by {|x| x.name}.at(input - 1)
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end
end
