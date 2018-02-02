class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    choice = ""
    until choice == "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      choice = gets.chomp
      list_songs if choice == "list songs"
      list_artists if choice == "list artists"
      list_genres if choice == "list genres"
      list_songs_by_artist if choice == "list artist"
      list_songs_by_genre if choice == "list genre"
      play_song if choice == "play song"
    end
  end

  def sorted_songs
    Song.all.sort { |a, b| a.name <=> b.name }
  end

  def list_songs
    sorted_songs.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort { |a, b| a.name <=> b.name }.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort { |a, b| a.name <=> b.name }.each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    artist = Artist.find_by_name(artist_name)
    if artist
      artist.songs.sort { |a, b| a.name <=> b.name }.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    genre = Genre.find_by_name(genre_name)
    if genre
      genre.songs.sort { |a, b| a.name <=> b.name }.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_no = gets.to_i
    song = sorted_songs[song_no - 1]
    puts "Playing #{song.name} by #{song.artist.name}" if song && song_no > 0
  end

end
