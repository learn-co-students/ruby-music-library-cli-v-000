class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
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
          artist
        when "list genre"
          genre
      end
    end
  end


  def artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end


  def play_song
    puts "What song number would you like to play?"
    input = gets.strip.to_i
    song = Song.all[input-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def artist
    puts "Which artist's songs?"
    input = gets.strip
    artist = Artist.find_by_name(input)
    songs = artist.songs
    songs.each {|i| puts "#{i.artist.name} - #{i.name} - #{i.genre.name}"}
  end

  def genre
    puts "Which genre's songs?"
    input = gets.strip
    genre = Genre.find_by_name(input)
    songs = genre.songs
    songs.each {|i| puts "#{i.artist.name} - #{i.name} - #{i.genre.name}"}
  end


end
