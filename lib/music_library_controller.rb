class MusicLibraryController

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = nil
    until input == "exit"
      puts "Welcome to Music Library!"
      puts "Please enter a command: list songs, artists, genres, or exit"
      input = gets.strip

      case input
        when "list songs"
        list_songs
        when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song  
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def play_song
    self.list_songs
    puts "What number song would you like to play?"
    player_input = gets.strip.to_i
    current_song =  Song.all[player_input-1]
    puts "Playing #{current_song.artist.name} - #{current_song.name} - #{current_song.genre.name}"
  end

end