class MusicLibraryController
  attr_accessor :path, :song_list, :hash_song_list, :sorted_hash_song_list, :array

  def initialize(path="./db/mp3s")
    n=0
    @path = path
    importer = MusicImporter.new(path)
    importer.import
    @array = []
    @song_list = Song.all
    @hash_song_list = {}
    @song_list.each_with_index do |song, i|
      n=1
      @hash_song_list["#{song.name}"] = i
    end
    @sorted_hash_song_list = @hash_song_list.sort_by { |k, v| k}
    @sorted_hash_song_list.each do |k, v|
      @array << @song_list[v]
    end
  end

  def list_songs
    n=0
    @sorted_hash_song_list.each do |song_name, index|
      n+=1
      puts "#{n}. #{@song_list[index].artist.name} - #{@song_list[index].name} - #{@song_list[index].genre.name}"
    end
  end

  def list_artists
    n=0
    artist_list = Artist.all
    hash_artist_list = {}
    artist_list.each_with_index do |artist, i|
      hash_artist_list["#{artist.name}"] = i
    end
    sorted_hash_artist_list = hash_artist_list.sort_by { |k, v| k}
    sorted_hash_artist_list.each do |artist_name, index_in_artist_list|
      n+=1
      puts "#{n}. #{artist_list[index_in_artist_list].name}"
    end
  end

  def list_genres
    n=0
    genre_list = Genre.all
    hash_genre_list = {}
    genre_list.each_with_index do |genre, i|
      hash_genre_list["#{genre.name}"] = i
    end
    sorted_hash_genre_list = hash_genre_list.sort_by { |k, v| k}
    sorted_hash_genre_list.each do |genre_name, index_in_genre_list|
      n+=1
      puts "#{n}. #{genre_list[index_in_genre_list].name}"
    end
  end

  def list_songs_by_artist
    n=0
    this_one = []
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    all_artists = Artist.all
    all_artists.each do |artist|
      if artist.name == user_input
        this_one << artist
        songs_hash = {}
        songs_list = this_one[0].songs

        songs_list.each_with_index do |song, i|
          songs_hash["#{song.name}"] = i
        end
        sorted_songs_hash = songs_hash.sort_by { |k, v| k}
        sorted_songs_hash.each do |song_name, index_in_songs_list|
          n+=1
          puts "#{n}. #{song_name} - #{songs_list[index_in_songs_list].genre.name}"
        end
      end
    end
  end

  def list_songs_by_genre
    n=0
    this_one = []
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    all_genres = Genre.all
    all_genres.each do |genre|
      if genre.name == user_input
        this_one << genre
        songs_hash = {}
        songs_list = this_one[0].songs

        songs_list.each_with_index do |song, i|
          songs_hash["#{song.name}"] = i
        end
        sorted_songs_hash = songs_hash.sort_by { |k, v| k}
        sorted_songs_hash.each do |song_name, index_in_songs_list|
          n+=1
          puts "#{n}. #{songs_list[index_in_songs_list].artist.name} - #{song_name}"
        end
      end
    end
  end

  def play_song
    n=0
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i
    in_to_i = user_input-1
    if user_input <= @array.length && user_input > 0
      puts "Playing #{@array[in_to_i].name} by #{@array[in_to_i].artist.name}"
    end
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
    input = gets.strip
    if input == "list songs"
      list_songs
    elsif input == "list artists"
      list_artists
    elsif input == "list genres"
      list_genres
    elsif input == "list artist"
      list_songs_by_artist
    elsif input == "list genre"
      list_songs_by_genre
    elsif input == "play song"
      play_song
    elsif input == "exit"
      return input
    else
      "Woah, I don't recognize those words. Try again!"
      call
    end
  end
end
