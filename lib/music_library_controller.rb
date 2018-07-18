class MusicLibraryController

  attr_accessor :songlist_storage

  def initialize(path = "./db/mp3s")
    object = MusicImporter.new(path)
    object.import
    @songlist_storage = Song.all.sort_by {|song| song.name}
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

    action = gets.strip

    case action
    when "exit"
      "exit"
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
    else
      self.call
    end
    #
    # if action == "exit"
    #   "exit"
    # else
    #   self.call
    # end
  end

  def list_songs
    i = 1
    array_of_songs = self.songlist_storage
    array_of_songs.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end
  end

  def list_artists
    i = 1
    array_of_artists = Artist.all.sort_by {|artist| artist.name}
    array_of_artists.each do |artist|
      puts "#{i}. #{artist.name}"
      i += 1
    end
  end

  def list_genres
    i = 1
    array_of_genres = Genre.all.sort_by {|genre| genre.name}
    array_of_genres.each do |genre|
      puts "#{i}. #{genre.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    artist = Artist.find_by_name(user_input)
    if artist == nil
      return nil
    else
      i = 1
      song_array = artist.songs.sort_by {|song| song.name}
      song_array.each do |song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    genre = Genre.find_by_name(user_input)
    if genre == nil
      return nil
    else
      i = 1
      genre_song_array = genre.songs.sort_by {|song| song.name}
      genre_song_array.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip

    song_array = self.songlist_storage

    if user_input.to_i > song_array.size || user_input.to_i < 1
      return nil
    else
      selected_artist = song_array[(user_input.to_i)-1].artist.name
      selected_song = song_array[(user_input.to_i)-1].name
      puts "Playing #{selected_song} by #{selected_artist}"
    end
  end

end
