class MusicLibraryController 
  attr_accessor = :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    music_importer_instance = MusicImporter.new(path)
    music_importer_instance.import
  end
  
  def call 
    options = ['list songs', 'list artists', 'list genres', 'list genres', 'list artist', 'list genre', 'play song', 'exit']
    
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    choice = gets.strip
    i = 0
    until i == 3 || options.any?{|option| option == choice}
      puts "What would you like to do?"
      choice = gets.strip
      i += 1
    end
    case choice
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
  
  def list_songs
    songs = Song.all.sort_by {|song| song.name}
    songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    artists = Artist.all.sort_by {|artist| artist.name}
    artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
   
  def list_genres
    genres = Genre.all.sort_by {|genre| genre.name}
    genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    artist_songs = Song.all.select {|song| song.artist.name == artist_name}
    artist_songs.sort_by! {|song| song.name}
    artist_songs.each_with_index do |song, index| 
      puts "#{index + 1}. #{song.name} - #{song.genre.name}" 
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    genre_songs = Song.all.select {|song| song.genre.name == genre_name}
    genre_songs.sort_by! {|song| song.name}
    genre_songs.each_with_index do |song, index| 
      puts "#{index + 1}. #{song.artist.name} - #{song.name}" 
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_choice = gets.chomp.to_i - 1
    songs = Song.all.sort_by {|song| song.name}
    songs.find.each_with_index do |song, index|
      if song_choice == index
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end



