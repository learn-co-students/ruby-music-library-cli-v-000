class MusicLibraryController

  def initialize(path='./db/mp3s')
    importer = MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts = "What would you like to do?"
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
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end  

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end  

  def play_song
    puts "Which song number would you like to play?"
    song_input = gets.strip
    song = Song.all[song_input.to_i - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "Which artist by name would you like to list songs for?"
    artist_input = gets.strip
    artist = Artist.find_by_name(artist_input)
    artist.songs.each do |song|
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "Which genre by name would you like to list songs for?"
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
    genre.songs.each do |song|
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end