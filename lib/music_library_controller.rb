class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @music_importer = MusicImporter.new(path)
    @music_importer.import
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
    #we need to use a case statement
    input = gets.strip
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
    end
    until input == "exit"
      input = gets.strip
    end
  end

  def list_songs
    all_songs = Song.all
    all_songs.sort! {|song_1, song_2| song_1.name <=> song_2.name}
    all_songs.collect! {|song| "#{song.artist.name} - #{song.name} - " + song.genre.name}
    all_songs.each_with_index {|song, index| puts "#{index + 1}. " + song}
  end

  def list_artists
    all_artists = Artist.all
    all_artists.collect! {|artist| artist.name}.sort!
    all_artists.each_with_index {|artist, index| puts "#{index + 1}. " + artist}
  end

  def list_genres
    all_genres = Genre.all
    all_genres.collect! {|genre| genre.name}.sort!
    all_genres.each_with_index {|genre, index| puts "#{index + 1}. " + genre}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.strip
    if Artist.find_by_name(name)
      artist = Artist.find_by_name(name)
      songs_by_artist_array = artist.songs.sort! {|song_1, song_2| song_1.name <=> song_2.name}
      songs_by_artist_array.collect! {|song| "#{song.name} - #{song.genre.name}"}
      songs_by_artist_array.each_with_index {|song, index| puts "#{index + 1}. " + song}
    else
      false
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input)
      genre = Genre.find_by_name(input)
      songs_by_genre_array = genre.songs.sort!{|song_1, song_2| song_1.name <=> song_2.name}
      songs_by_genre_array.collect! {|song| "#{song.artist.name} - #{song.name}"}
      songs_by_genre_array.each_with_index {|song, index| puts "#{index + 1}. " + song}
    else
      false
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    selected_index = input.to_i - 1
    if selected_index.between?(0, Song.all.length - 1)
      selected_song = Song.all.sort {|a, b| a.name <=> b.name}[selected_index]
      puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
    end
  end

end
