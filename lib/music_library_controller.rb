class MusicLibraryController
  attr_reader :path

  def initialize(file_path = './db/mp3s')
    @path = file_path
    song_imports = MusicImporter.new(path)
    song_imports.import
  end

  def call
      puts("Welcome to your music library!")
      puts("To list all of your songs, enter 'list songs'.")
      puts("To list all of the artists in your library, enter 'list artists'.")
      puts("To list all of the genres in your library, enter 'list genres'.")
      puts("To list all of the songs by a particular artist, enter 'list artist'.")
      puts("To list all of the songs of a particular genre, enter 'list genre'.")
      puts("To play a song, enter 'play song'.")
      puts("To quit, type 'exit'.")
      puts("What would you like to do?")
      user_input = gets.strip

      case user_input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song

      end

      self.call unless user_input == "exit"
  end

  def list_songs
    list_of_songs = Song.all
    list_of_songs.sort_by! { |song| song.name }
    list_of_songs.uniq!

    list_of_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

  end

  def list_artists
    list_of_artists = Artist.all
    list_of_artists.sort_by! { |artist| artist.name }
    list_of_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    list_of_genres = Genre.all
    list_of_genres.sort_by! { |genre| genre.name }
    list_of_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts("Please enter the name of an artist:")
    user_input = gets.strip

    artist = Artist.find_by_name(user_input)
      if artist != nil
        artist_song_array = artist.songs
        artist_song_array.sort_by! { |song| song.name }
        artist_song_array.each_with_index do |song, index|
          puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end
      end
  end

  def list_songs_by_genre
    puts("Please enter the name of a genre:")
    user_input = gets.strip

    genre = Genre.find_by_name(user_input)
      if genre != nil
        genre_song_array = genre.songs
        genre_song_array.sort_by! { |song| song.name }
        genre_song_array.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end
      end
  end

  def play_song
    puts("Which song number would you like to play?")
    list_of_songs = Song.all
    list_of_songs.sort_by! { |song| song.name }
    list_of_songs.uniq!
    user_input = gets.strip.to_i
    index = user_input.to_i - 1

    if (1..list_of_songs.count).include?(index)
      puts "Playing #{list_of_songs[index].name} by #{list_of_songs[index].artist.name}" unless list_of_songs[index] == nil
    end
    # binding.pry
    # if index.between?(1, song_list.count)
    #   puts "hi"
    # else
    #   puts "hey im not in range. lets try again."
    # end


    # if user_input.is_a?(Integer)
    #   index = user_input - 1
    #
    # end

  end
end
