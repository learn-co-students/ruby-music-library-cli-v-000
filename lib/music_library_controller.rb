class MusicLibraryController

  def initialize(path='./db/mp3s')
    @path = path
    @library = []
    @library = MusicImporter.new(path).import

  end

  def call
    puts "Welcome to your music library!"
    input = ""

    until input == "exit"
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
    @library.sort do |a,b|
      a.split(" - ")[1] <=> b.split(" - ")[1]
    end.each_with_index do |song, index|
      puts "#{index + 1}. #{song.chomp(".mp3")}"
    end
  end

  def list_artists
    Artist.all.sort do |a,b|
      a.name <=> b.name
    end.each_with_index do |a, i|
      puts "#{i + 1}. #{a.name}"
    end
  end

  def list_genres
    Genre.all.sort do |a,b|
      a.name <=> b.name
    end.collect.with_index do |a, i|
      puts "#{i + 1}. #{a.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    Song.all.select{|s| s.artist.name == input}
    .sort{|a,b| a.name <=> b.name}
    .each_with_index{|s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    Song.all.select{|s| s.genre.name == input}
    .sort{|a,b| a.name <=> b.name}
    .each_with_index{|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i - 1
    @library.sort! do |a,b|
      a.split(" - ")[1] <=> b.split(" - ")[1]
    end
    if input >= 0 && input < @library.length
      puts "Playing #{@library[input].split(" - ")[1]} by #{@library[input].split(" - ")[0]}"
    end
  end


end
