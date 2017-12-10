class MusicLibraryController
  attr_accessor :song_list

  def initialize(path="./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    user_input = nil
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    while user_input != "exit"
      puts "What would you like to do?"
      user_input = gets.strip
      case user_input
        when "list_songs"
          self.list_songs
      end
    end

  end

  def list_songs
    @song_list = Song.all.sort_by { | song | song.name }
    @song_list.each.with_index(1) { | song, i | puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    sorted = Artist.all.sort_by { | artist | artist.name }
    sorted.each.with_index(1) { | artist, i | puts "#{i}. #{artist.name}" }
  end

  def list_genres
    sorted = Genre.all.sort_by { | genre | genre.name }
    sorted.each.with_index(1) { | genre, i | puts "#{i}. #{genre.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name_input = gets.strip
    selected_artist = Artist.find_by_name(artist_name_input)
    if selected_artist
      sorted = selected_artist.songs.sort_by { | song | song.name }
      sorted.each.with_index(1) { | song, i | puts "#{i}. #{song.name} - #{song.genre.name}" }
    end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name_input = gets.strip
    selected_genre = Genre.find_by_name(genre_name_input)
    if selected_genre
      sorted = selected_genre.songs.sort_by { | song | song.name }
      sorted.each.with_index(1) { | song, i | puts "#{i}. #{song.artist.name} - #{song.name}" }
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number_input = gets.strip.to_i
    if song_number_input > 0 && song_number_input <= Song.all.length
      playing = Song.all.sort_by { | song | song.name }.detect.with_index(1) { | song, index | index == song_number_input }
      puts "Playing #{playing.name} by #{playing.artist.name}"
    end
  end

end


# music_library_controller = MusicLibraryController.new("./spec/fixtures/mp3s")
# music_library_controller
