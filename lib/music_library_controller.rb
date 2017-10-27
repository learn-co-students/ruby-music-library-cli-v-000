class MusicLibraryController
  def initialize(path="./db/mp3s")
    @path = path
    new_music_import = MusicImporter.new(path)
    new_music_import.import

    # OR just one line
    # MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
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
    end
  end

  def list_songs
    # sorted_songs = Song.all.sort_by { |song| song.name }
    # sorted_songs.each.with_index(1) do |song, idx|
    #   puts "#{idx}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    # end

    # OR
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    # sorted_artists = Artist.all.sort_by { |artist| artist.name }
    # sorted_artists.each_with_index do |artist, idx|
    #   puts "#{idx+1}. #{artist.name}"
    # end

    # OR
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def list_genres
    # sorted_genres = Genre.all.sort_by { |genre| genre.name }
    # sorted_genres.each_with_index do |genre, idx|
    #   puts "#{idx+1}. #{genre.name}"
    # end

    # OR
    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    # artist_name = gets.strip
    # artist = Artist.all.find { |singer| singer.name == artist_name }
    # if artist
    #   sorted_songs = artist.songs.sort_by { |song| song.name }
    #   sorted_songs.each_with_index do |song, idx|
    #     puts "#{idx+1}. #{song.name} - #{song.genre.name}"
    #   end
    # end

    # OR
    if artist = Artist.find_by_name(input)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    # genre_name = gets.strip
    # genre = Genre.all.find { |type| type.name == genre_name }
    # if genre
    #   sorted_genre = genre.songs.sort_by { |song| song.name }
    #   sorted_genre.each_with_index do |song, idx|
    #     puts "#{idx+1}. #{song.artist.name} - #{song.name}"
    #   end
    # end

    # OR
    if genre = Genre.find_by_name(input)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    sorted_songs = Song.all.sort_by { |song| song.name }
    if (number).between?(1, Song.all.size)
      puts "Playing #{sorted_songs[number - 1].name} by #{sorted_songs[number - 1].artist.name}"
    end

    # OR
    # input = gets.strip.to_i
    # if (1..Song.all.length).include?(input)
    #   song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    # end
    #
    # puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end
