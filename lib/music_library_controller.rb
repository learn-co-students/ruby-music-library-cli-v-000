class MusicLibraryController
# attributes, variables, modules
attr_accessor :path

# initialize
  def initialize(path = "./db/mp3s")
    @path = MusicImporter.new(path).import
  end

# instance methods
  def call
    user_input = ""
      puts "Welcome to your music library!"
      puts "What do you want to listen to? Search by song, artist or genre."
    while user_input != "exit"
      user_input = gets.chomp

    case user_input
       when "list songs"
         list_songs
       when "list artists"
         list_artists
       when "list genres"
         list_genres
       when "list songs by artist"
         list_artist_songs
       when "list songs in genre"
         list_genre_songs
       when "play song"
         play_song
       end
    end
  end

  def list_songs
    self.path.sort!.each {|filename| puts "#{(self.path.index(filename))+1}. #{filename}"}
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    puts "Which song would you like to play?"
    user_input = (gets.chomp.to_i) - 2
    puts "Playing #{Song.all[user_input].artist.name} - #{Song.all[user_input].name} - #{Song.all[user_input].genre.name}"
  end

  def list_artist_songs
    puts "Which artist would you like to listen to?"
    artist = gets.strip
    Artist.all.each do |a|
      if artist == a.name
        a.songs.collect {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
      end
    end
  end

  def list_genre_songs
    puts "Which genre would you like to listen to?"
    genre = gets.strip
    Genre.all.each do |g|
      if genre == g.name
        g.songs.collect { |g| puts "#{g.artist.name} - #{g.song.name} - #{g.name}"}
      end
    end
  end

end
