require'pry'
class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    #input = gets loop until input == "exit"
    input = ""
    while input != "exit"
      puts "Hey, Welcome to Williams Music Controller"
      puts "What would you like to do?"
      input = gets.strip
      case input
    when "list songs"
      songs
    when "list artists"
      artists
    when "list genres"
      genres
    when "play song"
      play_song
    when "list artist"
      list_artist
    when "list genre"
      list_genre
    end
  end
  end

  def songs
    #binding.pry
    Song.all.collect.with_index do |x, y| 
      #puts "x = #{x.artist.name}, y = #{y+1}"
      puts "#{y+1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
      #puts "#{y+1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
    end
  end

  def artists
    Artist.all.collect do |x|
      puts "#{x.name}"
    end
  end

  def genres
    Genre.all.collect {|x| puts "#{x.name}" }
  end

  def play_song
    #binding.pry
    "Which song would you like to hear?"
    song_num = gets.strip.to_i
    wanted = Song.all.fetch(song_num-1)
    puts "Playing #{wanted.artist.name} - #{wanted.name} - #{wanted.genre.name}"
    #Song.all.collect {|x| puts "Playing #{x.artist.name} - #{x.name} - #{x.genre.name}"}
  end

  def list_artist
    "Which artist you want bruh?"
    wanted_artist = gets.strip
    all_songs = Artist.all.select do |artist| 
      if artist.name == wanted_artist
        artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      end
    end
  end

  def list_genre

    "Now you want a genre's songs? Seriously? Alright which genre?..."
    wanted_genre = gets.strip
    all_genre = Genre.all.select do |genre|
      if genre.name == wanted_genre
        genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      end
    end



  end











end