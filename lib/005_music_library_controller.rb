class MusicLibraryController

  attr_reader :songs_names

  def initialize(path = "./db/mp3s")
    new_music_importer = MusicImporter.new(path)
    @songs_names = new_music_importer.import
  end

  def call

    answer = ""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."

    until answer == "exit"
      puts "What would you like to do?"
      answer = gets.chomp
    end
  end

  def list_songs
    name_order_hash = {}
    idx = 1
    @songs_names.each do |song_name|
      name_order_hash[song_name.split(" - ")[1]] = song_name.split(".")[0]
    end
    songs_sorted = name_order_hash.sort_by { |song_title, _full_title| song_title }
    songs_sorted.to_h.each_value do |each_song|
      puts "#{idx}. #{each_song}"
      idx += 1
    end
  end

  def list_artists
    artists_list = []
    idx = 1
    @songs_names.each do |song_name|
      artists_list << song_name.split(" - ")[0]
    end
    artists_list.uniq!.sort!
    artists_list.each do |each_artist|
      puts "#{idx}. #{each_artist}"
      idx += 1
    end
  end

  def list_genres
    genre_list = []
    idx = 1
    @songs_names.each do |song_name|
      genre_list << song_name[0..-5].split(" - ")[2]
    end
    genre_list.uniq!.sort!
    genre_list.each do |each_genre|
      puts "#{idx}. #{each_genre}"
      idx += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end
