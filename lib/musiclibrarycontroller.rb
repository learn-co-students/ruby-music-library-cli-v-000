class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "What would you like to do?"
    answer = ""
    until answer == "exit"
      answer = gets.chomp
      case answer
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

  def songs
    Song.all.each.with_index {|s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    }
  end

  def artists
    Artist.all.each {|i| puts "#{i.name}"}
  end

  def genres
    Genre.all.each {|i| puts "#{i.name}"}
  end

  def play_song
    puts "What song number would you like to play?"
    input = gets.strip.to_i
    song = Song.all[input-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def artist
    puts "For which artist would you like to list songs?"
    input = gets.strip
    artist = Artist.find_by_name(input)
    songs = artist.songs
    songs.each {|i| puts "#{i.artist.name} - #{i.name} - #{i.genre.name}"}
  end

  def genre
    puts "For which genre would you like to list songs?"
    input = gets.strip
    genre = Genre.find_by_name(input)
    songs = genre.songs
    songs.each {|i| puts "#{i.artist.name} - #{i.name} - #{i.genre.name}"}
  end

end
