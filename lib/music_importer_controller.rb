class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!\nWhat would you like to do? (list songs, list artists, list genres, play song, list artist, list genre, exit)"
      input = gets.strip
      case input
        when "list songs" then list_songs
        when "list artists" then list_artists
        when "list genres" then list_genres
        when "play song" then play_song
        when "list artist" then list_artist_songs
        when "list genre" then list_genre_songs
        else puts "invalid entry" unless input == "exit"
      end
    end
  end

  private

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each{|artist| puts artist.name}
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each{|genre| puts genre.name}
  end

  def play_song
    list_songs
    puts "What number song would you like to play?"
    song_input = gets.strip.to_i
    while song_input < 1 || song_input > Song.all.length
      puts "Invalid entry. What number song would you like to play?"
      song_input = gets.strip.to_i
    end
    selected_song = Song.all[song_input - 1]
    puts "Playing #{selected_song.artist.name} - #{selected_song.name} - #{selected_song.genre.name}"
  end

  def list_artist_songs
    list_artists
    puts "Which artist would you like to see the songs of?"
    artist_input = gets.strip
    until Artist.find_by_name(artist_input)
      puts "Invalid entry. Which artist would you like to see the songs of?"
      artist_input = gets.strip
    end
    Artist.find_by_name(artist_input).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre_songs
    list_genres
    puts "Which genre would you like to see the songs of?"
    genre_input = gets.strip
    until Genre.find_by_name(genre_input)
      puts "Invalid entry. Which genre would you like to see the songs of?"
      genre_input = gets.strip
    end
    Genre.find_by_name(genre_input).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end
