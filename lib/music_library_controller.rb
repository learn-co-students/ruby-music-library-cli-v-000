class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to CLI music library!"
      puts "Type your command:"
      input = gets.strip
      case input
      when "list songs"
        song
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

  def sort_songs
    Song.all.sort {|a,b| a.artist.name <=> b.artist.name}
  end

  def song
    sort_songs.each.with_index(1) do |song, i|
      #puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      puts "#{i}. #{song}"
    end
  end

  def play_song
    puts "What number of song?"
    input = gets.strip.to_i
    puts "Playing #{sort_songs[input-1]}"
  end

  def artists
    Song.all.each do |song|
      puts "#{song.artist.name}"
    end
  end

  def list_artist
    puts "What artist's name?"
    input = gets.strip
    Song.all.each { |song| puts "#{song}" if song.artist.name == input }
  end

  def list_genre
    puts "What artist's name?"
    input = gets.strip
    Song.all.each { |song| puts "#{song}" if song.genre.name == input }
  end

  def genres
    Song.all.each do |song|
      puts "#{song.genre.name}"
    end
  end
end
