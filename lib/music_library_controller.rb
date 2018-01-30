
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    library = MusicImporter.new(path)
    library.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def artists
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_artist
    puts "What artist by name you like to list songs for?"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_genre
    puts "What genre by name you like to list songs for?"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.each do |s,i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
  end

  def play_song
    puts "What song number would you like to play?"
    input = gets.strip
    s = Song.all[input.to_i-1]
    puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"
  end

  def songs
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end
end


