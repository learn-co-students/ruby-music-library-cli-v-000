require 'pry'

class MusicLibraryController

  attr_accessor :path, :songarray

  def initialize(path='./db/mp3s')
    @path = path
    #binding.pry
    music_importer = MusicImporter.new(path)
    music_importer.import
    #binding.pry
  end

  def call
    #welcome user
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    #gets input
    input = gets.strip

    case input
    when "list songs"
      list_songs
      call
    when "list artists"
      list_artists
      call
    when "list genres"
      list_genres
      call
    when "list artist"
      list_songs_by_artist
      call
    when "list genre"
      list_songs_by_genre
      call
    when "play song"
      play_song
      call
    when "exit"
    else
      call
    end


  end

  def list_songs
    i = 1
    songarray = []
    songarray = Song.all.sort_by {|song| song.name }
    songarray.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end
  end

  def list_artists
    i = 1
    newarray = []
    artistarray = []
    sortedartistarray = []
    Artist.all.each do |artist|
      artistarray << artist.name
    end
    sortedartistarray = artistarray.sort_by { |artist| artist }
    sortedartistarray.each do |artistname|
      puts "#{i}. #{artistname}"
      i += 1
    end
  end

  def list_genres
    i = 1
    newarray = []
    genrearray = []
    sortedgenrearray = []
    Genre.all.each do |genre|
      genrearray << genre.name
    end
    sortedgenrearray = genrearray.sort_by { |genre| genre }
    sortedgenrearray.each do |genrename|
      puts "#{i}. #{genrename}"
      i += 1
    end
  end

  def list_songs_by_artist
    i = 1
    matchartist = []
    sortedarray = []
    puts "Please enter the name of an artist:"
    input = gets.strip
    Song.all.each do |song|
      if song.artist.name == input
        matchartist << song
      end
    end
    if matchartist == nil
      self.list_songs_by_artist
    else
      sortedarray = matchartist.sort_by { |song| song.name}
      sortedarray.each do |song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i += 1
      end
    end
  end

  def list_songs_by_genre
    i = 1
    matchgenre = []
    sortedarray = []
    puts "Please enter the name of a genre:"
    input = gets.strip
    Song.all.each do |song|
      if song.genre.name == input
        matchgenre << song
      end
    end
    if matchgenre == nil
      self.list_songs_by_genre
    else
      sortedarray = matchgenre.sort_by { |song| song.name}
      sortedarray.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1
      end
    end
  end

  def play_song
    #list_songs
    puts "Which song number would you like to play?"
    input = gets.strip
    if (1..Song.all.length).include?(input.to_i)

      nowplaying = Song.all.sort {|x,y| x.name<=>y.name}[input.to_i-1]

      puts "Playing #{nowplaying.name} by #{nowplaying.artist.name}"

    end
  end


end


#learn spec/010_music_library_controller_spec.rb
#learn spec/011_music_library_cli_methods_spec.rb
#learn spec/012_music_library_cli_spec.rb
