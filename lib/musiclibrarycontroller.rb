class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    music = MusicImporter.new(path)
    music.import
  end

  def call
    choice = ""
    while choice != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      choice = gets.chomp

      case choice
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'play song'
        play_song
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      end
    end
  end

  def list_songs
    #Song.all.sort!{|a,b| a.name <=> b.name}.each_with_index do |song, index|
    Song.all.sort_by{|song| song.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    artist = Artist.find_by_name(artist_name)
    songs = []
    Song.all{|song| song.name}.each do |song|
      songs << song if song.artist == artist
      end
    songs.sort_by{|song| song.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    genre = Genre.find_by_name(genre_name)
    songs = []
    Song.all{|song| song.name}.each do |song|
      songs << song if song.genre == genre
      end
    songs.sort_by{|song| song.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    songs = Song.all.uniq.sort_by{|s| s.name}
    puts "Which song number would you like to play?"
    song_choice = gets.to_i
    if song_choice.between?(1, Song.all.length)
      song = songs[song_choice - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
