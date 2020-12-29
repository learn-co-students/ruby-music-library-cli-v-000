class MusicLibraryController
  
  def initialize(path='./db/mp3s')
    newImporter = MusicImporter.new(path)
    Song.all << newImporter.import
  end
  
  def library(klass = Song)
    sorted_library = klass.all.collect{|object|object if object.class == klass }
    sorted_library = sorted_library.delete_if {|object|object==nil}
    sorted_library.uniq 
  end
  
  def list_songs
    sorted_library = self.library.sort_by {|song|song.name}
    sorted_library.each do |song|
      puts "#{sorted_library.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def song_array
    sorted_library = self.library.sort_by {|song|song.name}
    sorted_library.collect do |song|
      "#{sorted_library.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    sorted_library = self.library(Artist).sort_by {|object|object.name}
    artists = sorted_library.collect {|object|"#{object.name}"}.uniq
    artists.each {|artist| puts "#{artists.index(artist) + 1}. #{artist}"}
  end
  
    def list_genres
    sorted_library = self.library.sort_by {|song|song.genre.name}
    genres = sorted_library.collect {|song|"#{song.genre.name}"}.uniq
    genres.each {|genre| puts "#{genres.index(genre) + 1}. #{genre}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    artist_songs = []
    self.library.each do |song|
      if song.artist.name == user_input
        artist_songs << song
      end
    end
    artist_songs = artist_songs.sort_by{|song|song.name}
    artist_songs.each {|song|puts "#{artist_songs.index(song) + 1}. #{song.name} - #{song.genre.name}"} unless artist_songs == nil
  end
  
  def name_extractor(filename)
    file_bits = filename.gsub(/\.mp3/,' ')
    file_bits = file_bits.split(" - ")
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    genre_songs = []
    self.library.each do |song|
      if song.genre.name == user_input
        genre_songs << song
      end
    end
    genre_songs = genre_songs.sort_by{|song|song.name}
    genre_songs.each {|song|puts "#{genre_songs.index(song) + 1}. #{song.artist.name} - #{song.name}"} unless genre_songs == nil
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_names = self.song_array
    user_input = gets.chomp.to_i 
    if user_input > 0 && user_input <= self.library.size 
      chosen_input = song_names[user_input - 1]
      chosen_input = name_extractor(chosen_input)[1]
      song = Song.find_by_name(chosen_input)
      puts "Playing #{song.name} by #{song.artist.name}" unless song == nil 
    end
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
    user_input = gets.chomp
    case user_input
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
    when "exit"
      'exit'
    else
      call
    end
  end
  
end
  