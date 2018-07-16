class MusicLibraryController
  attr_accessor :path, :songs

  @@song_list = []

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
    @song_list = []
  end

  def call
    input = nil
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp

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
    self.update_song_list
    @song_list.sort_by! { |obj| obj.name }
    counter = 1
    @song_list.each do |s|
      puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      counter += 1
    end
  end

  def list_artists
      artist_list = Artist.all.sort_by! { |obj| obj.name }
      counter = 1
      artist_list.each do |a|
        puts "#{counter}. #{a.name}"
        counter += 1
      end
    end


  def list_genres
    genre_list = Genre.all.sort_by! { |obj| obj.name }
    counter = 1
    genre_list.each do |g|
      puts "#{counter}. #{g.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp

    songs = Song.all.select { |song| song.artist.name == artist}
    sorted = songs.sort_by { |song| song.name }

    sorted.each.with_index(1) do |song, i|
      puts "#{i}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    songs = Song.all.select { |song| song.genre.name == genre}
    sorted = songs.sort_by { |song| song.name }
    sorted.each.with_index(1) do |song, f|
      puts "#{f}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    index = gets.chomp.to_i - 1

    songs = Song.all.sort_by { |song| song.name }

    songs.each_index.detect do |i|
      if index == i
        puts "Playing #{songs[index].name} by #{songs[index].artist.name}"
      end
  end
  end

  def update_song_list
      Song.all.each do |s|
        if !@@song_list.include?(s)
          @@song_list << s
          @song_list << s
        end
      end
    end
end
