class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
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
    end
    until input == "exit"
      puts "What would you like to do?"
      input = gets.strip
    end
  end

  def alphabetize_songs
    song_array = []
    song_array = Song.all.sort_by { |song| song.name }
    song_array.each_with_index do |song, i|
      song_array[i] = "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    song_array
  end

  def list_songs
    alphabetize_songs.each { |index| puts index }
  end

  def list_artists
    artists_array = []
    Artist.all.each { |artist| artists_array << artist.name }
    artists_array.sort.each_with_index do |artist, i|
    puts "#{i+1}. #{artist}"
  end
  end

  def list_genres
    genres_array = []
    genres_array = Genre.all.sort_by { |genre| genre.name}
    genres_array.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    input = Artist.all.detect {|artist| artist.name == input}
    if input != nil
      input = input.songs.sort_by {|song| song.name }
      input.each_with_index do |song, i|
        puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    input = Genre.all.detect {|genre| genre.name == input}
    if input != nil
      input = input.songs.sort_by {|song| song.name }
      input.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    list_songs
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    #until (input > 0) && (input < list_songs.length)
    #  puts "Which song number would you like to play?"
    #end
      puts "Playing #{[input-1]}."
  end

end
