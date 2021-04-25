class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Enter a command(input help to see a list of commands): "
    x = gets.chomp
    while x != "exit"
      if x == "list songs"
        list_songs
      elsif x == "list artists"
        list_artists
      elsif x == "list genres"
        list_genres
      elsif x == "play song"
        play_song
      elsif x == "list artist"
        list_artists_songs
      elsif x == "list genre"
        list_genres_songs
      elsif x == "help"
        puts "Here are the available commands: "
        puts "list songs"
        puts "list genres"
        puts "play song"
        puts "list artist"
        puts "list genre"
        puts "exit"
      end
      puts "Enter another command(input help to see a list of commands): "
      x = gets.chomp
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index+1}. " + song.artist.name + " - " + song.name + " - " +song.genre.name
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
    puts "Enter a song number to play: "
    song_index = gets.chomp.to_i - 1
    song = Song.all[song_index]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artists_songs
    puts "Enter an artist name: "
    artist_name = gets.chomp
    artist = Artist.find_by_name(artist_name)
    artist.songs.each do |song|
      puts song.artist.name + " - " + song.name + " - " +song.genre.name
    end
  end

  def list_genres_songs
    puts "Enter a genre name: "
    genre_name = gets.chomp
    genre = Genre.find_by_name(genre_name)
    genre.songs.each do |song|
      puts song.artist.name + " - " + song.name + " - " +song.genre.name
    end
  end

end