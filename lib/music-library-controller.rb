class MusicLibraryController
  # attr_reader :current_song_list

  def initialize(path='./db/mp3s')
    new_import = MusicImporter.new(path)
    new_import.import
    # @current_song_list = []
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
    user_choice = gets.strip
    case user_choice
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
    end
    self.call unless user_choice == 'exit'
  end

  def list_songs
    ordered_songs = Song.all.sort_by {|song| song.name}
    ordered_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    ordered_artists = Artist.all.sort_by {|artist| artist.name}
    ordered_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    ordered_genres = Genre.all.sort_by {|genre| genre.name}
    ordered_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    req_artist = gets.strip

    if artist_object = Artist.find_by_name(req_artist)
      sorted_songs = artist_object.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    req_genre = gets.strip

    if genre_object = Genre.find_by_name(req_genre)
      sorted_songs = genre_object.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_request = gets.strip.to_i

    selected_song = Song.all.sort_by {|song| song.name}[song_request - 1]
    if selected_song && song_request >= 1 && song_request <= Song.all.length
      puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
    end
  end
end
