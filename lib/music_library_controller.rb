class MusicLibraryController
  attr_accessor :music, :songs

  def initialize(path = "./db/mp3s")
    @music = MusicImporter.new(path)
    @music.import
  end

  def call
    input = ""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    while input != "exit"
      input = gets
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
      else
      end
    end
  end

  def sorted_songs
    a_index = 0
    b_index = 0
    songs = music.files.sort do |a,b|
      a_index = a.index(" - ")
      b_index = b.index(" - ")
      a[a_index..-1] <=> b[b_index..-1]
    end
  end

  def list_songs
    sorted_songs.each_with_index {|song, index| puts "#{index+1}. " + song.chomp(".mp3")}
  end

  def list_artists
    artists = Artist.all.collect {|artist| artist.name}.sort
    artists.each_with_index {|name, index| puts "#{index+1}. " + name}
  end

  def list_genres
    genres = Genre.all.collect {|genre| genre.name}.sort
    genres.each_with_index {|genre, index| puts "#{index+1}. " + genre}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if Artist.find_by_name(input)
        artist = Artist.find_by_name(input)
        sorted_songs = artist.songs.sort{|a,b| a.name <=> b.name}
        sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    if Genre.find_by_name(input)
        genre = Genre.find_by_name(input)
        sorted_songs = genre.songs.sort{|a,b| a.name <=> b.name}
        sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets
    input = input.to_i
    if input > 0 && input <= sorted_songs.length
      playing = sorted_songs[input-1].split(" - ")
      puts "Playing #{playing[1]} by #{playing[0]}"
    end
  end
end
