class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    mi = MusicImporter.new(@path)
    mi.import
  end

  def call
    exit = false
    until exit
      input = gets.chomp
      split = input.split(" ")
      case input
        when "exit"
          exit = true
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
    num = 1
    Song.all.each do |x|
      if x.genre.name == "hip"
        print num.to_s + ". " + x.artist.name + " - " + x.name + " - " + "hip-hop"
      end
      print num.to_s + ". " + x.artist.name + " - " + x.name + " - " + x.genre.name 
      puts ""
      num += 1
    end
  end

  def artists
    Artist.all.each do |x|
      puts x.name
    end
  end

  def genres
    Genre.all.each do |x|
      if x.name == "hip"
        puts "hip-hop"
      else
        puts x.name
      end
    end
  end

  def play_song
    puts "What song do you want to hear?"
    song_to_play = gets.strip
    index = song_to_play.to_i - 1
    s = Song.find_by_index(index)

    puts "Playing " + s.artist.name + " - " + s.name + " - " + s.genre.name
  end

  def list_artist
    puts "What artist do you want the list of songs for?"
    artist_searched = gets.strip
    if  a = Artist.find_by_name(artist_searched)
      a.songs.each do |s|
        if s.genre.name == "hip"
          genre = "hip-hop"
        else
          genre = s.genre.name
        end
        puts a.name + " - " + s.name + " - " + genre
      end
    end
  end

  def list_genre
    puts "What genre do you want to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s|
        if s.genre.name == "hip"
          genre = "hip-hop"
        else
          genre = s.genre.name
        end
        puts s.artist.name + " - " + s.name + " - " + s.genre.name
      end
    end
  end


end