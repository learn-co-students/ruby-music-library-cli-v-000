class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = nil
    until input == "exit"
      puts "Hi! Welcome to Command Line Music Library."
      puts 'Your options are:
        list songs            - Lists all songs
        list artists          - Lists all artists
        list genres           - Lists all genres
        play song             - Plays a song
        list artist           - Lists an artist\'s songs
        list genre            - Lists a genre\'s songs
        exit                  - Exits the program
      '
      puts "Please input a command."
      
      input = gets.chomp
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        artist_songs
      when "list genre"
        genre_songs
      end
    end
  end

  def songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each {|artist| puts artist.name}
  end

  def genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    self.songs
    puts "What song would you like to play? Please enter the number: "
    s_num_input = gets.chomp.to_i
    curr_song = Song.all[s_num_input - 1]
    puts "Playing #{curr_song.artist.name} - #{curr_song.name} - #{curr_song.genre.name}"
  end

  def artist_songs
    self.artists
    puts "Which artist would you like to list songs for?"
    artist_input = gets.chomp
    artist = Artist.find_by_name(artist_input)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def genre_songs
    self.genres
    puts "Which genre would you like to list songs for?"
    genre_input = gets.chomp
    genre = Genre.find_by_name(genre_input)
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end
end