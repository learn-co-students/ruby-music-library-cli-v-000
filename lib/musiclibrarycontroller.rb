class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.chomp

    case input
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
      when "exit"
        return "exit"
      else
        call
     end
  end

  def list_songs
    alpha_songs = Song.all.sort_by {|song| song.name}
    alpha_songs.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    alpha_artists = Artist.all.sort_by {|artist| artist.name}
    alpha_artists.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}" }
  end

  def list_genres
    alpha_genres = Genre.all.sort_by {|genre| genre.name}
    alpha_genres.each_with_index { |genre, index| puts "#{index + 1}. #{genre.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist != nil
      alpha_songs = artist.songs.sort_by {|song| song.name}
      alpha_songs.each_with_index { |song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}" }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre != nil
      alpha_genres = genre.songs.sort_by {|song| song.name}
      alpha_genres.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}" }
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    alpha_songs = Song.all.sort_by {|song| song.name}

    if input > 0 && input <= alpha_songs.size
      song = alpha_songs[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
