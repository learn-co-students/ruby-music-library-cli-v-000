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
    s = Song.all.first
    puts "Playing " + s.artist.name + " - " + s.name + " - " + s.genre.name 
  end

  def list_artist
    a = Artist.find_by_name("Real Estate")
    puts a.name + " - " + a.songs[0].name + " - " + a.songs[0].genre.name
    puts a.name + " - " + a.songs[1].name + " - " + "hip-hop"
  end

  def list_genre
    puts "Thundercat - For Love I Come - dance"
  end


end