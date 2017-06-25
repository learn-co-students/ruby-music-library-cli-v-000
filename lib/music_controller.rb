class MusicLibraryController

  def initialize(filepath="./db/mp3s")
    MusicImporter.new(filepath).import
  end

  def call
    response = ""
    puts "Welcome to your music library!"
    list_instructions
    while response != 'exit'
      response = gets.chomp
      case response
      when 'help'
        list_instructions
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
      else
        puts "What would you like to do?"
        response = gets.chomp
      end
    end
  end

  def list_instructions
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
  end

  def list_songs
  songs = Song.all.sort_by { |song| song.name }
    songs.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artist_arr = Artist.all.collect { |a| a.name }.sort
    artist_arr.each_with_index do |a,i| puts "#{i+1}. #{a}"
    end
  end

  def list_genres
    genre_arr = Genre.all.collect { |g| g.name }.sort
    genre_arr.each_with_index do |g, i|
      puts "#{i+1}. #{g}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
      # binding.pry
      artist = Artist.find_by_name(user_input)
      if artist
        sorted_arr = artist.songs.sort_by do |s|
          s.name
        end
        sorted_arr.each_with_index do |s,i|
          puts "#{i+1}. #{s.name} - #{s.genre.name}"
        end
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
      # binding.pry
      genre = Genre.find_by_name(user_input)
      if genre
        sorted_arr = genre.songs.sort_by do |s|
          s.name
        end
        sorted_arr.each_with_index do |s,i|
          puts "#{i+1}. #{s.artist.name} - #{s.name}"
        end
      end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.to_i
    i = user_input - 1
    if user_input >= 1 && user_input <= Song.all.count && user_input != nil
      song_arr = Song.all.sort_by { |s| s.name }
      puts "Playing #{song_arr[i].name} by #{song_arr[i].artist.name}"
    end
  end

end
