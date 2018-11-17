class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end
  def call
    action = ""
    while action != "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      action = gets

      if action == 'list songs'
        list_songs
      elsif action == 'list artists'
        list_artists
      elsif action == 'list genres'
        list_genres
      elsif action == 'list artist'
        list_songs_by_artist
      elsif action == 'list genre'
        list_songs_by_genre
      elsif action == 'play song'
        play_song
      end

    end
  end

  def list_songs
    Song.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets)
    if artist
      artist.songs.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets)
    if genre
      genre.songs.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    sorted_songs = Song.all.sort{|a,b| a.name <=> b.name}
    number = gets.to_i
    if number-1 < sorted_songs.size && number > 0
      song = sorted_songs[number-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
