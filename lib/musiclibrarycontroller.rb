class MusicLibraryController

  attr_accessor :songs

  def initialize(path="./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
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
    input = ""
    while input != "exit"
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
    end
  end

  def list_songs
    sorted = Song.all.sort { |a, b| a.name <=> b.name}
    sorted.each_with_index do |song, index|
      puts "#{index +1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists

    sorted = Artist.all.sort { |a, b| a.name <=> b.name}

    sorted = sorted.each_with_index do |artist, index|
      prev = sorted[index - 1].name
      if artist.name == prev
        sorted.delete_at(index)
      end
    end
    sorted.each_with_index do |artist, index|
      puts "#{index +1}. #{artist.name}"
    end
  end

  def list_genres
    sorted = Genre.all.sort { |a, b| a.name <=> b.name}
    sorted = sorted.each_with_index do |genre, index|
      prev = sorted[index - 1].name
      if genre.name == prev
        sorted.delete_at(index)
      end
    end
    sorted.each_with_index do |genre, index|
      puts "#{index +1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    sorted = Song.all.sort { |a, b| a.name <=> b.name}
    artists = sorted.map do |song|
      song.artist.name
    end
    if artists.include?(input)
      sorted = sorted.select {|song| song.artist.name == input}
      sorted.each_with_index do |song, index|
        puts "#{index +1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    sorted = Song.all.sort { |a, b| a.name <=> b.name}
    genres = sorted.map do |song|
      song.genre.name
    end
    if genres.include?(input)
      sorted = sorted.select {|song| song.genre.name == input}
      sorted.each_with_index do |song, index|
        puts "#{index +1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    input = input.to_i
    index = input - 1
    sorted = Song.all.sort { |a, b| a.name <=> b.name}
    if input <= sorted.size && input > 0
      puts "Playing #{sorted[index].name} by #{sorted[index].artist.name}"
    end
  end

end
