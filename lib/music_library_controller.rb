class MusicLibraryController
  attr_accessor :song_list

  def initialize(path="./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    user_input = nil
    options = ["To list all of your songs, enter 'list songs'.",
      "To list all of the artists in your library, enter 'list artists'.",
      "To list all of the genres in your library, enter 'list genres'.",
      "To list all of the songs by a particular artist, enter 'list artist'.",
      "To list all of the songs of a particular genre, enter 'list genre'.",
      "To play a song, enter 'play song'.",
      "To quit, type 'exit'."]
    puts "Welcome to your music library!"
    options.each { | option | puts option }
    while user_input != "exit"
      puts "What would you like to do?"
      user_input = gets.strip
      case user_input
        when "list songs"
          self.list_songs
        when "list artists"
          self.list_artists
        when "list genres"
          self.list_genres
        when "list artist"
          self.list_songs_by_artist
        when "list genre"
          self.list_songs_by_genre
        when "play song"
          self.play_song
        when "options"
          options.each { | option | puts option }
        else
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
