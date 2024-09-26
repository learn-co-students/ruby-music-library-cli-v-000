class MusicLibraryController

  def initialize(path = "./db/mp3s")
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
    input = gets.strip
    if input != "exit"
      self.call
    end
    case input
    when "list songs"
      self.list_songs
    when "list artists"
      self.list_artists
    when "list genres"
      self.list_genres
    when "list artist"
      self.list_songs_by_artist
    when "list genre"
      self.list_songs_by_genre
    when "play song"
      self.play_song
    end
  end

  def list_songs
    sorted = Song.all.sort_by {|song| song.name}
    sorted.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted = Artist.all.sort_by {|artist| artist.name}
    sorted.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    sorted = Genre.all.sort_by {|genre| genre.name}
    sorted.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
      artist = Artist.find_by_name(input)
      if artist.is_a?(Artist)
      sorted = artist.songs.sort_by {|song| song.name}
      sorted.each_with_index do |song, index|
      puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
      genre = Genre.find_by_name(input)
      if genre.is_a?(Genre)
      sorted = genre.songs.sort_by {|song| song.name}
      sorted.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input < Song.all.count
      index = input-1
      sorted = Song.all.sort_by {|song| song.name}
      song = sorted[index]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
