class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @library = MusicImporter.new(path).import
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
    loop do
      puts "What would you like to do?"
      case gets.strip
      when "exit"
        exit
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
      end
    end
  end

  def sort_library
    @sorted_library = Song.all.sort_by {|song| song.name}
  end

  def list_songs
    sort_library.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    artist_library = Artist.all.collect{|artist| artist.name}.uniq
    artist_library.sort.each_with_index {|artist_name, index| puts "#{index + 1}. #{artist_name}"}
  end

  def list_genres
    genre_library = Genre.all.collect{|genre| genre.name}.uniq
    genre_library.sort.each_with_index {|genre_name, index| puts "#{index + 1}. #{genre_name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    songs_by_artist = sort_library.select{|song| song.artist.name == artist_name}
    songs_by_artist.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    songs_in_genre = sort_library.select{|song| song.genre.name == genre_name}
    songs_in_genre.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip
    if song_number.to_i > 0 && song_number.to_i <= sort_library.length
      selected_song = sort_library[song_number.to_i - 1]
      puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
    end
  end
end
