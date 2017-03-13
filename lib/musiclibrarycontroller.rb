class MusicLibraryController

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def list_songs
    Song.all.each_with_index {|song, index| puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    puts "Select the song you wish to play by typing in its corresponding number."
    song_number = gets.chomp.to_i
    song_index = song_number - 1
    song = Song.all[song_index]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artists_songs
    puts "Type the name of the artist whose songs you wish to browse."
    artist_name = gets.chomp.split(" ").collect{|word| word.capitalize}.join(" ")
    artist = Artist.find_by_name(artist_name)
    artist.songs.each {|song| puts "#{artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genres_songs
    puts "Type the name of the genre in order to browse its songs."
    genre_name = gets.chomp.downcase
    genre = Genre.find_by_name(genre_name)
    genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{genre.name}"}
  end

  def call
    puts "Welcome! Begin browsing this music library by songs, artists or genres."
    user_input = ""

    until user_input == "exit"
      puts "Please type a command."
      user_input = gets.chomp.downcase
      case user_input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "play song"
        self.play_song
      when "list artist"
        self.list_artists_songs
      when "list genre"
        self.list_genres_songs
      when "exit"
        puts "We hope you enjoyed browsing our music library. Goodbye for now!"
      else
        puts "That course of action could not be executed. Please enter a valid command."
      end
    end
  end
end
